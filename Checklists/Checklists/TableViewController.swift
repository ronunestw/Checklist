//
//  TableViewController.swift
//  Checklists
//
//  Created by Rodrigo Nunes on 27/03/18.
//  Copyright © 2018 Thoughtworks. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var content : [(isChecked : Bool, description : String)] = []
    
    func initTupleArrayContent() {
        for index in 1...50 {
            content.append((isChecked: false, description: "My checklist descriotion number: \(index)"))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTupleArrayContent()
    }

    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            var cellContent = content[indexPath.row]
            cellContent.isChecked = !cellContent.isChecked
            
            if cellContent.isChecked == true {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
            
            content[indexPath.row] = cellContent
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return content.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TODO Duvidas - Identificadores com string apenas?
        //Encontrar views com Tag é normal?
        
        //TODO Esse padrao de nomear metodos é normal?
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "ChecklistItem",
            for: indexPath)

        let label = cell.viewWithTag(100) as! UILabel
        label.text = content[indexPath.row].description
        
        if content[indexPath.row].isChecked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        // End of new code block
        return cell

    }

}

