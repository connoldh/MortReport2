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
    
    var favorites = [String]()
    var favoriteTest = Favorites()
    var defaultsData = UserDefaults.standard
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
        
        favorites = defaultsData.stringArray(forKey: "favorites") ?? [String]()
        self.navigationItem.title = "Favorites"
        

    }
    
    func saveFavorites() {
        /*let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(favorites){
            UserDefaults.standard.set(encoded, forKey: "favorites")
        } else {
            print("ERROR: Saving encoded did not work")
        }*/
    }
    

}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favoritesTableView.dequeueReusableCell(withIdentifier: "Cell3", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row+1). \(favorites[indexPath.row])"
        return cell
    }
    
    
}
