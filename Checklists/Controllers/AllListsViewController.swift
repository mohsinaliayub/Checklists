//
//  AllListsViewController.swift
//  Checklists
//
//  Created by Mohsin Ali Ayub on 05.11.23.
//

import UIKit

class AllListsViewController: UITableViewController{
    private let cellIdentifier = "ChecklistCell"
    private var lists = [Checklist]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        lists.append(Checklist(name: "Birthdays"))
        lists.append(Checklist(name: "Groceries"))
        lists.append(Checklist(name: "Cool Apps"))
        lists.append(Checklist(name: "To Do"))
    }
    
    
    // MARK: - Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        lists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let checklist = lists[indexPath.row]
        cell.textLabel?.text = checklist.name
        cell.accessoryType = .detailDisclosureButton
        
        return cell
    }
    
    // MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowChecklist", sender: nil)
    }
}
