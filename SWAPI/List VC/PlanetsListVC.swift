//
//  PlanetsTableViewController.swift
//  SWAPI
//
//  Created by Wheatley on 15.04.2022.
//

import UIKit

class PlanetsListViewController: UITableViewController {
    
    
    
    @objc func loadNextPage() {
        
        requestPlanetsListNetworkResponse(stringURL: nextListUrlString) { planetsArray in
            self.planets.append(contentsOf: planetsArray.results)
            self.nextListUrlString = planetsArray.next
            
        }
        
    }

    
    var nextListUrlString = ""
    var planets: [PlanetNetworkResponse] = [] {
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        requestPlanetsListNetworkResponse(stringURL: storageURLStrings.planetsURLStringMain) { planetsArray in
            self.planets = planetsArray.results
            self.nextListUrlString = planetsArray.next
            
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.title = "planets"
    }
    
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = PlanetInfoTableViewController()
        vc.planet = planets[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == planets.count - 1 {
            loadNextPage()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return planets.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let currentPlanet = planets[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = currentPlanet.name
        cell.accessoryType = .disclosureIndicator
        
        cell.contentConfiguration = content
        
        
        return cell
    }
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
}


