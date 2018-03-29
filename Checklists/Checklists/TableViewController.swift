//
//  TableViewController.swift
//  Checklists
//
//  Created by Rodrigo Nunes on 27/03/18.
//  Copyright © 2018 Thoughtworks. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, AddItemDelegate {

    var content = [ChecklistItem]()
    
    func initTupleArrayContent() {
        for index in 1...50 {
            content.append(ChecklistItem(isChecked: false, description: "My checklist descriotion number: \(index)"))
        }
    }
    
    func sendNewCheckListItem(_ newItem : ChecklistItem) {
        content.append(newItem)
        tableView.reloadData()
        
        //TODO Perguntawr para Juliana
//        let newRowIndex = content.count
//        let indexPath = IndexPath(row: newRowIndex, section: 0)
//        let indexPaths = [indexPath]
//        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    
    func sendEditedCheckListItem(_ newItem : ChecklistItem) {
        if let index = content.index(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath) {
//                configureText(for: cell, with: item)
                tableView.reloadData()
            }
        }
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTupleArrayContent()
    }

    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
//        if let cell = tableView.cellForRow(at: indexPath) {
//            let cellContent = content[indexPath.row]
//            cellContent.toggleChecked()
//            configureCheckmark(for: cell as! ChecklistCellItem, with: cellContent)
//        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCellEditingStyle,
        forRowAt indexPath: IndexPath) {
        
        content.remove(at: indexPath.row)
        
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return content.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "ChecklistItem",
            for: indexPath) as! ChecklistCellItem

        let cellContent = content[indexPath.row]
        
        configureText(for: cell, with: cellContent)
        configureCheckmark(for: cell, with: cellContent)
        
        return cell
    }

    func configureText(for cell: ChecklistCellItem,
                       with item: ChecklistItem) {
        cell.configure(item.itemDescription)
    }
    
    func configureCheckmark(for cell: ChecklistCellItem,
                            with item: ChecklistItem) {
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addItemVc = segue.destination as? AddItemViewController {
            addItemVc.delegate = self
            if  segue.identifier == "editItemSegue",
                let rowIndex = tableView.indexPathForSelectedRow?.row {
                addItemVc.checklistItem = content[rowIndex]
            }
        }
    }
}

