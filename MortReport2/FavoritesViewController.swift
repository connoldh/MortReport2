//
//  FavoritesViewController.swift
//  MortReport2
//
//  Created by John Connolly on 4/29/19.
//  Copyright © 2019 John Connolly. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {

    @IBOutlet weak var favoritesTableView: UITableView!
    
    var favoriteTest = Favorites()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
        self.navigationItem.title = "Favorites"
        

    }
    

    

}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteTest.favoritedArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favoritesTableView.dequeueReusableCell(withIdentifier: "Cell3", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row+1). \(favoriteTest.favoritedArray[indexPath.row])"
        return cell
    }
    
    
}
