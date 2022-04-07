//
//  CartDataSource.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/21/22.
//

import Foundation

class CartDataSource {
    lazy var currentCart: CartModel = {
        let cart = CartModel(items: [ItemDataSource().itemA,
                                     ItemDataSource().itemB],
                             total: "32.99")
        return cart
    }()
}
