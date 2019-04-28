//
//  LocationViewController.swift
//  MortReport2
//
//  Created by John Connolly on 4/28/19.
//  Copyright © 2019 John Connolly. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {

    @IBOutlet weak var locationTableView: UITableView!
    
    var locations = Locations()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationTableView.dataSource = self
        locationTableView.delegate = self
        self.navigationItem.title = "Locations"
        locations.getLocations {
            self.locationTableView.reloadData()
        }
    }


}


extension LocationViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.locationArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = locationTableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row+1). \(locations.locationArray[indexPath.row].name)"
        if indexPath.row == locations.locationArray.count-1 && locations.apiLocationURL.hasPrefix("http") {
            locations.getLocations {
                self.locationTableView.reloadData()
            }
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowLocationDetail" {
            let destination = segue.destination as! LocationDetailViewController
            let selectedIndex = locationTableView.indexPathForSelectedRow!
            destination.locationInfo = locations.locationArray[selectedIndex.row]
        }
    }
    
    
}
