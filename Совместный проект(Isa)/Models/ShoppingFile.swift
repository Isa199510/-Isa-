//
//  ShoppingFile.swift
//  Совместный проект(Isa)
//
//  Created by Иса on 01.12.2022.
//

import Foundation

struct Purchase {
    let name: String
    let quantity: Double
    let price: Double
    
    var amount: Double {
        quantity * price
    }
    
    init() {
        name = ""
        quantity = 0.0
        price = 0.0
    }
    init(name: String, quantity: Double, price: Double) {
        self.name = name
        self.quantity = quantity
        self.price =  price
    }
}

struct ShoppingLists {
    let name: String
    var purchases: [Purchase] 
    
    var totalPrice: Double {
        var amount = 0.0
        for purchase in purchases {
            amount += purchase.amount
        }
        return amount
    }
    
    init(_ name: String) {
        self.name = name
        purchases = [Purchase()]
    }
    
    mutating func setPurchase(_ purchase: Purchase, index: Int?) {
        if let index = index {
            self.purchases[index] = purchase
        } else {
            self.purchases.append(purchase)
        }
    }
}

