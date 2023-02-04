//
//  GroceryListController.swift
//  Совместный проект(Isa)
//
//  Created by Иса on 01.02.2023.
//

import UIKit

class GroceryListController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var shopping: ShoppingLists!
    var at: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    @IBAction func valueForQuantity(_ sender: UIStepper) {
        let buttonPosition = sender.convert(sender.bounds.origin, to: tableView)
        if let index = tableView.indexPathForRow(at: buttonPosition) {
            if let at = at {
//                shoppingLists[at].purchases?[index.row].quantity = sender.value
//                shoppingLists[at].purchases?[index.row].setQuantity(sender.value)
                print(shoppingLists[at], shopping.purchases?[index.row])
                
            }
            tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
        }
    }
    
}

extension GroceryListController {
    func setupUI() {
        if let shopping = shopping {
            title = shopping.name
        }
    }
}

extension GroceryListController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let shopping = shopping {
            return shopping.purchases?.count ?? 0
        }
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let groceryCell = tableView.dequeueReusableCell(withIdentifier: "groceryCell", for: indexPath) as? GroceryViewCell
        else {
            return UITableViewCell()
        }
        groceryCell.configure((shopping.purchases?[indexPath.row])!)
        
        return groceryCell
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if let shopping = shopping {
            if !(shopping.purchases?.isEmpty != nil) {
                return ""
            } else {
                return "Общая сумма: \(shopping.totalPrice)"
            }
        }
        return ""
    }
    
}

