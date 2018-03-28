//
//  ChecklistCellItem.swift
//  Checklists
//
//  Created by Rodrigo Nunes on 28/03/18.
//  Copyright © 2018 Thoughtworks. All rights reserved.
//

import UIKit

class ChecklistCellItem: UITableViewCell {

    @IBOutlet weak var customText: UILabel!
    
    func configure(_ content : String) {
        customText.text = content
    }
    
}
