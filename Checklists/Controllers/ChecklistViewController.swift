//
//  ChecklistViewController.swift
//  Checklists
//
//  Created by Mohsin Ali Ayub on 31.10.23.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    var items: [ChecklistItem] = []
    
    let todoItems = [
        "Walk the dog", "Brush my teeth", "Learn iOS development",
        "Soccer practice", "Eat ice cream"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let item1 = ChecklistItem(text: "Walk the dog")
        items.append(item1)
        
        let item2 = ChecklistItem(text: "Brush my teeth", checked: true)
        items.append(item2)
        
        let item3 = ChecklistItem(text: "Learn iOS development", checked: true)
        items.append(item3)
        
        let item4 = ChecklistItem(text: "Soccer practice")
        items.append(item4)
        
        let item5 = ChecklistItem(text: "Eat ice cream")
        items.append(item5)
    }
    
    func configureCheckmark(for cell: UITableViewCell, at indexPath: IndexPath) {
        
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
    
    // MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        
        cell.accessoryType = cell.accessoryType == .none ? .checkmark : .none
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

