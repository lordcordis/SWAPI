//
//  PlanetTableViewController.swift
//  SWAPI
//
//  Created by Wheatley on 18.04.2022.
//

import UIKit

class PlanetInfoTableViewController: UITableViewController {
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    

    
    
    let cellIDForInfo = "cellPlanetInfo"
    let cellIDForResidents = "cellIDForResidents"
    
    var planet: PlanetNetworkResponse!
    
    var approvedResidents: [CharacterNetworkResponse] = [] {
        didSet {
            reloadData()
        }
    }
    
    var films: [FilmNetworkResponse] = [] {
        didSet{
            reloadData()
        }
    }
    
    func getFilms() {
        
        
        for filmUrl in planet.films {
            requestFilmNetworkResponse(stringURL: filmUrl) { film in
                self.films.append(film)
            }
        }
    }
    
    
    func getResidents () {
        guard let residentsArrayOfStringURLS = planet.residents else { return }
        for residentURL in residentsArrayOfStringURLS {
            requestCharacterNetworkResponse(stringURL: residentURL) { people in
                self.approvedResidents.append(people)
            }
        }
    }
    
    
    func reloadDataAsCompletion (completionHandler: () -> Void) {
        completionHandler()
        reloadData()
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let getFilmsCompletion: () -> Void = {
//            DispatchQueue.global(qos: .utility).async {
//                self.getFilms()
//            }
//        }
//
//        let getResidentsCompletion: () -> Void = {
//            DispatchQueue.global(qos: .utility).async {
//                self.getResidents()
//            }
//        }
        
        
//        reloadDataAsCompletion(completionHandler: getResidentsCompletion)
//        reloadDataAsCompletion(completionHandler: getFilmsCompletion)
        
        
        getResidents()
        getFilms()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return approvedResidents.count
        }else if section == 2 {
            return films.count
        } else {
            return 0
        }
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch section {
//        case 0: return "Planet: \(planet.name)"
//        case 1: return "Residents"
//        case 2: return "Films"
//        default:
//            return "WHAT"
//        }
//    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Planet: \(planet.name)"
        case 1: if approvedResidents.isEmpty {
            return "Residents unknown"
        } else {
            return "Residents "
        }
        case 2: return "Films"
        default:
            return "WHAT"
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIDForInfo)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIDForInfo, for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        let info = planetDescription(planet: planet)
        
        if indexPath == [0,0] {
            content.text = info [0]
        } else if indexPath.section == 1 {
            cell.accessoryType = .disclosureIndicator
            content.text = approvedResidents[indexPath.row].name
        } else if indexPath.section == 2 {
            cell.accessoryType = .disclosureIndicator
            content.text = films[indexPath.row].title
        } else {
            content.text = "SSSS"
        }
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            let residentToExport = approvedResidents[indexPath.row]
            let vc = PersonInfoTableViewController()
            vc.person = residentToExport
            navigationController?.pushViewController(vc, animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
        } else if indexPath.section == 2 {
            let filmToExport = films[indexPath.row]
            let vc = FilmInfoTableViewController()
            vc.film = filmToExport
            navigationController?.pushViewController(vc, animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        

    }
}

