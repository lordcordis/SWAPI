//
//  PlanetTableViewController.swift
//  SWAPI
//
//  Created by Wheatley on 18.04.2022.
//

import UIKit

class PersonInfoTableViewController: UITableViewController {
    
    
    let personTableViewCell = "personTableViewCell"
    
    var person: CharacterNetworkResponse!
    var homeworldPlanet: PlanetNetworkResponse?
    
    var films: [FilmNetworkResponse] = [] {
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    var homeworldName: String? {
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    
    
    
    func getHomeworld () {
        requestPlanetNetworkResponse(stringURL: person.homeworld) { [self] planet in
            let planetName = planet.name
            let planetOutput = planet
            homeworldPlanet = planetOutput
            homeworldName = planetName
            
        }
    }
    
    func getFilms() {
        
        
        for filmUrl in person.films {
            requestFilmNetworkResponse(stringURL: filmUrl) { film in
                self.films.append(film)
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getHomeworld()
        getFilms()
//        view.backgroundColor = .systemPink
//        getResidents()
//        confirmResidents()
        
//        navigationController?.navigationBar.topItem?.title = planet.name
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else if section == 2 {
            return films.count
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Person: \(person.name)"
        case 1: return "Homeworld"
        case 2: return "Films"
        default:
            return "WHAT"
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: personTableViewCell)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: personTableViewCell, for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        let info = characterDescription(character: person)
        
        if indexPath == [0,0] {
            content.text = info
        } else if indexPath.section == 1 {
            content.text = homeworldName
            cell.accessoryType = .disclosureIndicator
        } else if indexPath.section == 2{
            content.text = films[indexPath.row].title
            cell.accessoryType = .disclosureIndicator
        }
    
        
        cell.contentConfiguration = content
        
//        print("INDEX PATH \(indexPath)")
//        print("INDEX PATH ROW \(indexPath.row)")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 1{
            let vc = PlanetInfoTableViewController()
            vc.planet = homeworldPlanet
            navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.section == 2{
            let vc = FilmInfoTableViewController()
            vc.film = films[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
