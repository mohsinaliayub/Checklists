//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Mohsin Ali Ayub on 31.10.23.
//

import Foundation

class ChecklistItem: NSObject, Codable {
    var text: String
    var checked: Bool
    
    init(text: String, checked: Bool = false) {
        self.text = text
        self.checked = checked
        super.init()
    }
}
