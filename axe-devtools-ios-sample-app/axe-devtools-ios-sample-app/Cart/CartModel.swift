//
//  CartModel.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/21/22.
//

import Foundation

class CartModel {
    var tabTitle = "Cart"
    var iconName = "Bag"
    var items: [ItemModel]
    var total: String

    init(items: [ItemModel], total: String) {
        self.items = items
        self.total = total
    }
}

extension CartModel {
    var imageName: String {
        return "Wallet"
    }

    var price: String {
        return "$104.20"
    }
}
