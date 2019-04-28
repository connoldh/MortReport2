//
//  LocationDetailViewController.swift
//  MortReport2
//
//  Created by John Connolly on 4/28/19.
//  Copyright © 2019 John Connolly. All rights reserved.
//

import UIKit

class LocationDetailViewController: UIViewController {

   
    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var locationTypeLabel: UILabel!
    @IBOutlet weak var locationDimensionLabel: UILabel!
    
    var locationInfo = LocationInfo()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUserInterface()
        
    }
    
    func updateUserInterface() {
        locationNameLabel.text = locationInfo.name
        locationTypeLabel.text = locationInfo.type
        locationDimensionLabel.text = locationInfo.dimension
    }
}
