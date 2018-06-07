//
//  ViewController.swift
//  Lista de Tarefas
//
//  Created by Mary Béds on 07/06/18.
//  Copyright © 2018 Maria Eugênia Teixeira. All rights reserved.
//

import UIKit

class MainVC: UITableViewController {
    
    var itemArray = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.tile = "One"
        newItem.done = true
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.tile = "Two"
        itemArray.append(newItem2)
        
         let newItem3 = Item()
        newItem3.tile = "Three"
        itemArray.append(newItem3)

        
    }
    
    //MARK - TableView DataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
    
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.tile
        
        
        if item.done { cell.accessoryType = .checkmark }
        else { cell.accessoryType = .none }
        
        return cell
        
    }
    
    //MARK - TableView Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //MARK - Add new Itens
    
    @IBAction func btnAddPressed(_ sender: Any) {
        
        var itemTxt = UITextField()
        
        let alert = UIAlertController(title: "Adicionar novo ítem", message: "", preferredStyle: .alert)
        
        alert.addTextField { (alertTxtField) in
            alertTxtField.placeholder = "Criar novo ítem"
            itemTxt = alertTxtField
        }
        
        let action = UIAlertAction(title: "Adicinar", style: .default) { (action) in
            
            if !(itemTxt.text?.isEmpty)! {
            
                let item = Item()
                item.tile = itemTxt.text!
                
                self.itemArray.append(item)
                self.tableView.reloadData()
                
            }
            
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
}

