//
//  GroceryViewCellTableViewCell.swift
//  Совместный проект(Isa)
//
//  Created by Иса on 01.02.2023.
//

import UIKit

class GroceryViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var valueStepper: UIStepper!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        self.inde
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(_ purchase: Purchase) {
        nameLabel.text = purchase.name
        priceLabel.text = "Сумма: \(purchase.price.formatted()) ₽"
        quantityLabel.text = "\(purchase.quantity.formatted()) шт"
        valueStepper.value = purchase.quantity
    }

    
}
