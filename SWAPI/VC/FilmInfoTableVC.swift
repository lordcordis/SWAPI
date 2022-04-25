//
//  FilmInfoTableVC.swift
//  SWAPI
//
//  Created by Wheatley on 20.04.2022.
//

import UIKit

class FilmInfoTableViewController: UITableViewController {
    
    
    let FilmTableViewCell = "FilmTableViewCell"
    
    var film: FilmNetworkResponse!
//    var homeworldPlanet: PlanetNetworkResponse?
//    var homeworldName: String? {
//        didSet{
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
//    }
    
    
//    var homeworldURLString: String?
    
    
    
//    func getHomeworld () {
//
//        requestFilm(stringURL: person.homeworld) { [self] planet in
//            let planetName = planet.name
//            let planetOutput = planet
//            homeworldPlanet = planetOutput
//
//
//            homeworldName = planetName
//
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        getHomeworld()
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
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return 1
//        } else if section == 1 {
//            return 1
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Film: \(film.title)"
//        case 1: return "Homeworld"
        default:
            return "WHAT"
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: FilmTableViewCell)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: FilmTableViewCell, for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        let info = filmDescription(film: film)
        
        if indexPath == [0,0] {
            content.text = info
//        } else if indexPath.section == 1 {
//            content.text = homeworldPlanet?.name
        } else {
            content.text = "SSSS"
        }
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        if indexPath.section == 1{
//            let vc = PlanetInfoTableViewController()
//            vc.planet = homeworldPlanet
//            navigationController?.pushViewController(vc, animated: true)
//        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
