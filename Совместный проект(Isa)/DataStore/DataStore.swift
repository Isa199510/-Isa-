//
//  DataStore.swift
//  Совместный проект(Isa)
//
//  Created by Иса on 01.12.2022.
//

import Foundation

var shoppingLists = [ShoppingLists]()

func getShoppingList() -> [ShoppingLists] {
    let purchaseOne = Purchase(name: "хлеб", quantity: 2, price: 25)
    let purchaseTwo = Purchase(name: "молоко", quantity: 1, price: 100)
    var shoppingOne = ShoppingLists("супермаркет")
    shoppingOne.purchases = [purchaseOne, purchaseTwo]
    shoppingLists.append(shoppingOne)
    
    let purchaseThree = Purchase(name: "огурцы", quantity: 2, price: 150)
    let purchaseFour = Purchase(name: "помидоры", quantity: 1, price: 200)
    let purchaseFive = Purchase(name: "помидоры", quantity: 1, price: 200)
    var shoppingTwo = ShoppingLists("рынок")
    shoppingTwo.purchases = [purchaseThree, purchaseFour, purchaseFive]
    shoppingLists.append(shoppingTwo)

    shoppingLists.append(ShoppingLists("Запчасти"))
    
    return shoppingLists
}
