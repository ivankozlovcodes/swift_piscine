//
//  TodoListViewControllerTableViewController.swift
//  ex02
//
//  Created by Ivan Kozlov on 10/4/19.
//  Copyright © 2019 Ivan Kozlov. All rights reserved.
//

import UIKit

class TodoListViewControllerTableViewController: UITableViewController {
    
    var todoList: [TodoItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item1 = TodoItem()
        item1.text = "Git gud at swift"
        item1.isImportant = true
        let item2 = TodoItem()
        item2.text = "Make bank"
        item2.isImportant = true
        let item3 = TodoItem()
        item3.text = "Chill"
        item3.isImportant = false
        todoList = [item1, item2, item3]

//        tableCell.textLabel?.lineBreakMode = .byWordWrapping
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping;

        let todoItem = todoList[indexPath.row]
        let importance = todoItem.isImportant ? "☝️" : ""
        cell.textLabel?.text = importance + " " + todoItem.text
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            todoList.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let addVC = segue.destination as! TodoAddViewController
        addVC.previousVC = self
    }
}
