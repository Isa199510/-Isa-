//
//  ViewController.swift
//  Совместный проект(Isa)
//
//  Created by Иса on 01.12.2022.
//

import UIKit

class ShoppingListController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var shoppings = getShoppingList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 80
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    
    @IBAction func newShopping(_ sender: UIBarButtonItem) {
        let alert = self.alertForShopping("", at: nil) { title in
            let indexPath = IndexPath(row: 0, section: 0)
            self.shoppings.insert(ShoppingLists(title), at: 0)
            self.tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        present(alert, animated: true)
    }
}

extension ShoppingListController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        shoppings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let shoppingCell = tableView.dequeueReusableCell(withIdentifier: "shoppingCell") as? ShoppingViewCell else { return UITableViewCell() }
        shoppingCell.configure(
            shoppings[indexPath.row].name,
            totalPrice: shoppings[indexPath.row].totalPrice
        )
        return shoppingCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showGroceryList", sender: indexPath.row as Int)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let edit = UIContextualAction(style: .normal, title: "") { (ac: UIContextualAction, view: UIView, succes:(Bool) -> Void) in

            let alert = self.alertForShopping(self.shoppings[indexPath.row].name, at: indexPath.row) {title in
                self.shoppings[indexPath.row].name = title
                tableView.reloadRows(at: [indexPath], with: .automatic)
            }
            self.present(alert, animated: true)
            
            succes(true)
        }
        edit.image = UIImage(systemName: "trash")
        edit.backgroundColor = .red
        
        return UISwipeActionsConfiguration(actions: [edit])
    }
    
    
//    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let complete = UIContextualAction(style: .normal, title: "complete") { (_, _, isComplete) in
//            
//            let cell = tableView.cellForRow(at: indexPath)
//            cell?.backgroundColor = .green
//            isComplete(true)
//        }
//        
//        return UISwipeActionsConfiguration(actions: [complete])
//    }
}

extension ShoppingListController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let groceryVC = segue.destination as? GroceryListController {
            groceryVC.shopping = shoppings[sender as? Int ?? 0] as ShoppingLists
            groceryVC.at = sender as? Int ?? 0
        }
    }
    
    private func edittingElement(_ title: String, at: Int) {
        let indexPath = IndexPath(row: at, section: 0)
        shoppings[at].name = title
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    private func newElememtShopping(_ title: String) {
        let indexPath = IndexPath(row: 0, section: 0)
        shoppings.insert(ShoppingLists(title), at: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
 
    func alertForShopping(_ text: String, at: Int?, handler: @escaping(_ title: String) -> Void) -> UIAlertController {

        let title = at != nil ? "Изменение записи" : "Новая запись"
        
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addTextField()
        alert.textFields?.first?.text = text
        let cancel = UIAlertAction(title: "Cancel", style: .destructive)
        let ok = UIAlertAction(title: "OK", style: .default) { _ in
            guard let text = alert.textFields?.first?.text else { return }
            if text.count > 3 {
                handler(text)
            }
        }
        alert.addAction(ok)
        alert.addAction(cancel)
        
        return alert
    }
    
}
