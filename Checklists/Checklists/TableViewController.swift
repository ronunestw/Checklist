//
//  TableViewController.swift
//  Checklists
//
//  Created by Rodrigo Nunes on 27/03/18.
//  Copyright © 2018 Thoughtworks. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var content = [ChecklistItem]()
    
    func initTupleArrayContent() {
        for index in 1...50 {
            content.append(ChecklistItem(isChecked: false, description: "My checklist descriotion number: \(index)"))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTupleArrayContent()
    }

    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let cellContent = content[indexPath.row]
            cellContent.toggleChecked()
            configureCheckmark(for: cell, with: cellContent)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return content.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "ChecklistItem",
            for: indexPath)

        let cellContent = content[indexPath.row]
        
        configureText(for: cell, with: cellContent)
        configureCheckmark(for: cell, with: cellContent)
        
        return cell
    }

    func configureText(for cell: UITableViewCell,
                       with item: ChecklistItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.description
    }
    
    func configureCheckmark(for cell: UITableViewCell,
                            with item: ChecklistItem) {
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
}

