//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Rodrigo Nunes on 28/03/18.
//  Copyright © 2018 Thoughtworks. All rights reserved.
//

import Foundation

class ChecklistItem {
    var description = ""
    private(set) var checked = false
    
    init(isChecked: Bool, description: String) {
        self.checked = isChecked
        self.description = description
    }
    
    func toggleChecked() {
        checked = !checked
    }
}
