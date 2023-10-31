//
//  ChecklistViewController.swift
//  Checklists
//
//  Created by Mohsin Ali Ayub on 31.10.23.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    let todoItems = [
        "Walk the dog", "Brush my teeth", "Learn iOS development",
        "Soccer practice", "Eat ice cream"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = todoItems[indexPath.row]
        
        return cell
    }
}

