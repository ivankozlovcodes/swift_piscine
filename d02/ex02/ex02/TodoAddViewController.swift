//
//  TodoAddViewController.swift
//  ex02
//
//  Created by Ivan Kozlov on 10/4/19.
//  Copyright © 2019 Ivan Kozlov. All rights reserved.
//

import UIKit

class TodoAddViewController: UIViewController {
    
    var previousVC = TodoListViewControllerTableViewController()
    
    @IBOutlet var textInput: UITextField!
    @IBOutlet var importantSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()

        textInput.becomeFirstResponder()
    }

    @IBAction func addTodo() {
        let todo = TodoItem()
        
        todo.text = textInput.text!
        todo.isImportant = importantSwitch.isOn
        previousVC.todoList.append(todo)
        previousVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
}
