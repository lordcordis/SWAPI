//
//  PlanetTableViewController.swift
//  SWAPI
//
//  Created by Wheatley on 18.04.2022.
//

import UIKit

class PlanetInfoTableViewController: UITableViewController {
    
    
    let cellIDForInfo = "cellPlanetInfo"
    let cellIDForResidents = "cellIDForResidents"
    
    var planet: PlanetNetworkResponse!
    
    
    var approvedResidents: [PeopleNetworkResponse] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    func getResidents () {
        guard let residentsArrayOfStringURLS = planet.residents else { return }
        print(residentsArrayOfStringURLS)
        for residentURL in residentsArrayOfStringURLS {
            requestPeopleNetworkResponse(stringURL: residentURL) { people in
                self.approvedResidents.append(people)
            }
        }
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        getResidents()
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
        return 2
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return 1
        } else if section == 1 {
            return approvedResidents.count
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Planet: \(planet.name)"
        case 1: return "Residents"
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
            content.text = approvedResidents[indexPath.row].name
        } else {
            content.text = "SSSS"
        }
        
        
        cell.contentConfiguration = content
        
//        print("INDEX PATH \(indexPath)")
//        print("INDEX PATH ROW \(indexPath.row)")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let residentToExport = approvedResidents[indexPath.row]
        let personToExport = peopleResponseConvert(inc: residentToExport)
        
        let vc = PersonInfoTableViewController()
        vc.person = personToExport
        navigationController?.pushViewController(vc, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
