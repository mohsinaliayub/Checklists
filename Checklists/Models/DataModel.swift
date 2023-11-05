//
//  DataModel.swift
//  Checklists
//
//  Created by Mohsin Ali Ayub on 05.11.23.
//

import Foundation

class DataModel {
    var lists = [Checklist]()
    
    var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    var dataFilePath: URL { documentsDirectory.appendingPathComponent("Checklists.plist") }
    
    init() {
        loadChecklists()
    }
    
    func saveChecklists() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(lists)
            try data.write(to: dataFilePath, options: .atomic)
        } catch {
            print("Error encoding list array: \(error.localizedDescription)")
        }
    }
    
    func loadChecklists() {
        guard let data = try? Data(contentsOf: dataFilePath) else { return }
        
        let decoder = PropertyListDecoder()
        do {
            lists = try decoder.decode([Checklist].self, from: data)
        } catch {
            print("Error decoding list array: \(error.localizedDescription)")
        }
    }
}
