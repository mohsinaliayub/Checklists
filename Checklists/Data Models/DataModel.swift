//
//  DataModel.swift
//  Checklists
//
//  Created by Mohsin Ali Ayub on 04.01.21.
//

import Foundation

class DataModel {
    
    private let checklistIndexKey = "ChecklistIndex"
    private let firstTimeKey = "FirstTime"
    var lists = [Checklist]()
    
    var indexOfSelectedChecklist: Int {
        get {
            return UserDefaults.standard.integer(forKey: checklistIndexKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: checklistIndexKey)
        }
    }
    
    class var nextChecklistItemID: Int {
//        get {
        let userDefaults = UserDefaults.standard
        let itemID = userDefaults.integer(forKey: "ChecklistItemID")
        userDefaults.set(itemID + 1, forKey: "ChecklistItemID")
        userDefaults.synchronize()
        return itemID
//        }
    }
    
    init() {
        // load data from plist and register defaults
        loadChecklists()
        registerDefaults()
        handleFirstTime()
    }
    
    func sortChecklists() {
        self.lists.sort { list1, list2 in
            list1.name.localizedStandardCompare(list2.name) == .orderedAscending
        }
    }
    
    func registerDefaults() {
        let dictionary: [String: Any] = [checklistIndexKey: -1, firstTimeKey: true]
        UserDefaults.standard.register(defaults: dictionary)
    }
    
    func handleFirstTime() {
        let userDefaults = UserDefaults.standard
        let firstTime = userDefaults.bool(forKey: firstTimeKey)
        
        if firstTime {
            let checklist = Checklist(name: "List")
            lists.append(checklist)
            
            indexOfSelectedChecklist = 0
            userDefaults.set(false, forKey: firstTimeKey)
            userDefaults.synchronize()
        }
    }
    
    // MARK:- Data Saving
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Checklists.plist")
    }
    
    func saveChecklists() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(lists)
            
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
        } catch {
            print("Error encoding list array: \(error.localizedDescription)")
        }
    }
    
    func loadChecklists() {
        if let data = try? Data(contentsOf: dataFilePath()) {
            let decoder = PropertyListDecoder()
            do {
                lists = try decoder.decode([Checklist].self, from: data)
                sortChecklists()
            } catch {
                print("Error decoding list array: \(error.localizedDescription)")
            }
        }
    }
}
