//
//  CartViewModel.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/21/22.
//

import Foundation

class CartViewModel {
    let sectionTitle = "Cart"
    let currentCart = CartDataSource().currentCart

    var title: String {
        return currentCart.tabTitle
    }

    var iconName: String {
        return currentCart.iconName
    }

    var items: [ItemModel] {
        return currentCart.items
    }

    var imageName: String {
        return currentCart.imageName
    }

    var price: String {
        return currentCart.price
    }
}

extension CartViewModel {
    var deleteButtonText: String {
        return "Delete all"
    }
}
