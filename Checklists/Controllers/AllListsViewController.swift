//
//  AllListsViewController.swift
//  Checklists
//
//  Created by Mohsin Ali Ayub on 05.11.23.
//

import UIKit

class AllListsViewController: UITableViewController{
    private let cellIdentifier = "ChecklistCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    
    // MARK: - Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = "List \(indexPath.row)"
        return cell
    }
}
