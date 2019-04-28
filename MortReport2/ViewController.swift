//
//  ViewController.swift
//  MortReport2
//
//  Created by John Connolly on 4/28/19.
//  Copyright © 2019 John Connolly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    @IBOutlet weak var characterTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var characters = Characters()


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        characterTableView.dataSource = self
        characterTableView.delegate = self
        self.navigationItem.title = "Characters"
        characters.getCharacters {
            self.characterTableView.reloadData()
        }
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.characterArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = characterTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = "\(indexPath.row+1). \(characters.characterArray[indexPath.row].name)"
        if indexPath.row == characters.characterArray.count-1 && characters.apiURL.hasPrefix("http") {
            characters.getCharacters {
                self.characterTableView.reloadData()
            }
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowCharacterDetail" {
            let destination = segue.destination as! CharacterDetailViewController
            let selectedIndex = characterTableView.indexPathForSelectedRow!
            destination.characterInfo = characters.characterArray[selectedIndex.row]
        }
    }
   

}
