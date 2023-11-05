//
//  Checklist.swift
//  Checklists
//
//  Created by Mohsin Ali Ayub on 05.11.23.
//

import Foundation

class Checklist: NSObject {
    var name: String
    var items: [ChecklistItem]
    
    init(name: String) {
        self.name = name
        items = []
        super.init()
    }
}
