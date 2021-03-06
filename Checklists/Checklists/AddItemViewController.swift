//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Rodrigo Nunes on 28/03/18.
//  Copyright © 2018 Thoughtworks. All rights reserved.
//

import UIKit

protocol AddItemDelegate : class {
    func sendNewCheckListItem(_ newItem : ChecklistItem)
    func sendEditedCheckListItem(_ newItem : ChecklistItem)
}

class AddItemViewController: UITableViewController {
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    
    var delegate : AddItemDelegate?
    var checklistItem : ChecklistItem? {
        didSet {
            isEditingChecklistItem = .EDIT
        }
    }
    var isEditingChecklistItem : ActionStatus = .ADD
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        textField.text = checklistItem?.itemDescription
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if isEditingChecklistItem == .EDIT {
            checklistItem?.itemDescription = textField.text ?? ""
            delegate?.sendEditedCheckListItem(checklistItem!)
        } else if isEditingChecklistItem == .ADD {
            delegate?.sendNewCheckListItem(ChecklistItem(isChecked: false, description: textField.text!))
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textField.becomeFirstResponder()
    }
    
    @IBAction func cancel() {
        isEditingChecklistItem = .CANCEL
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done() {
        navigationController?.popViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
}

extension AddItemViewController : UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let oldText = textField.text!
        let stringRange = Range(range, in:oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        
        if newText.isEmpty {
            doneBarButton.isEnabled = false
        } else {
            doneBarButton.isEnabled = true
        }
        return true
    }
}

enum ActionStatus {
    case ADD
    case EDIT
    case CANCEL
}
