//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Rodrigo Nunes on 28/03/18.
//  Copyright © 2018 Thoughtworks. All rights reserved.
//

import Foundation

class ChecklistItem : CustomStringConvertible, Equatable {
    var description: String {return "\(itemDescription) - isChecked: \(checked)"}
    
    var itemDescription = ""
    private(set) var checked = false
    
    init(isChecked: Bool, description: String) {
        self.checked = isChecked
        self.itemDescription = description
    }
    
    func toggleChecked() {
        checked = !checked
    }
    
    static func == (lhs: ChecklistItem, rhs: ChecklistItem) -> Bool {
        return lhs.itemDescription == rhs.itemDescription
    }
}
