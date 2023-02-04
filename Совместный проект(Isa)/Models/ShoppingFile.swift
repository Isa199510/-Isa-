//
//  ShoppingFile.swift
//  Совместный проект(Isa)
//
//  Created by Иса on 01.12.2022.
//

import Foundation

struct Purchase {
    let name: String
    let price: Double
    var quantity: Double
    
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
    var name: String
    var purchases: [Purchase]?
    
    var totalPrice: Double {
        var amount = 0.0
        if let purchases = purchases {
            for purchase in purchases {
                amount += purchase.amount
            }
        }
        return amount
    }
    
    init(_ name: String) {
        self.name = name
    }
    
    mutating func setPurchase(_ purchase: Purchase, index: Int?) {
        if let index = index {
            self.purchases?[index] = purchase
        } else {
            self.purchases?.append(purchase)
        }
    }
}

extension Purchase {
    mutating func addOne() {
        quantity += 1
    }
    
    mutating func subOne() {
        quantity -= 1
    }
    
    mutating func setQuantity(_ value: Double) {
        quantity = value
    }
}
