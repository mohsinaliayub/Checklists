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
        let item = items[indexPath.row]
        cell.accessoryType = item.checked ? .checkmark : .none
    }
    
    // MARK: - Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let item = items[indexPath.row]
        
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
        configureCheckmark(for: cell, at: indexPath)
        
        return cell
    }
    
    // MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        
        let item = items[indexPath.row]
        item.checked.toggle()
        
        configureCheckmark(for: cell, at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

