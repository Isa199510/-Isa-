//
//  ShoppingViewCell.swift
//  Совместный проект(Isa)
//
//  Created by Иса on 01.12.2022.
//

import UIKit

class ShoppingViewCell: UITableViewCell {

    @IBOutlet var nameShoppingLabel: UILabel!
    @IBOutlet var totalPriceShoppingLabel: UILabel!
    
    func configure(_ name: String, totalPrice: Double) {
        nameShoppingLabel.text = name
        totalPriceShoppingLabel.text = totalPrice == 0 ? "" : "Общая сумма: \(totalPrice)"
    }
    
    func configure(_ shopping: ShoppingLists) {
        nameShoppingLabel.text = shopping.name
//        totalPriceShoppingLabel.text = shopping.totalPrice
    }
}
