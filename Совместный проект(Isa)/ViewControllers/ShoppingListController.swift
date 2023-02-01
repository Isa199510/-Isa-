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
        
        
        let purchaseOne = Purchase(name: "хлеб", quantity: 2, price: 25)
        let purchaseTwo = Purchase(name: "молоко", quantity: 1, price: 100)
        var shoppingOne = ShoppingLists("супермаркет")
        shoppingOne.purchases = [purchaseOne, purchaseTwo]
        shoppings.append(shoppingOne)
        
        let purchaseThree = Purchase(name: "огурцы", quantity: 2, price: 150)
        let purchaseFour = Purchase(name: "помидоры", quantity: 1, price: 200)
        let purchaseFive = Purchase(name: "помидоры", quantity: 1, price: 200)
        var shoppingTwo = ShoppingLists("рынок")
        shoppingTwo.purchases = [purchaseThree, purchaseFour, purchaseFive]
        shoppings.append(shoppingTwo)
        
        shoppings.append(ShoppingLists("Запчасти"))
        
        tableView.rowHeight = 80
        tableView.reloadData()
    }

    
    @IBAction func newShopping(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Новая запись", message: nil, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .destructive)
        let ok = UIAlertAction(title: "OK", style: .default) {[unowned self] _ in
            guard let text = alert.textFields?.first?.text else { return }
            if text.count > 3 {
                newElememtShopping(text)
            }
        }
        
        alert.addTextField()
        alert.addAction(ok)
        alert.addAction(cancel)
        
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
        tableView.deselectRow(at: indexPath, animated: true
        
        )
    }
}

extension ShoppingListController {
    
    private func edittingElement() {
        
    }
    
    private func newElememtShopping(_ title: String) {
        let indexPath = IndexPath(row: 0, section: 0)
        shoppings.insert(ShoppingLists(title), at: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
}
