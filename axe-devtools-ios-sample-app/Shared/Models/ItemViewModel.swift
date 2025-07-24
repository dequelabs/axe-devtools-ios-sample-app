//
//  ItemViewModel.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/15/22.
//

import Foundation

class ItemViewModel {
    var item: ItemModel

    init(item: ItemModel) {
        self.item = item
    }

    var imageName: String {
        return item.imageName
    }

    var name: String {
        return item.name
    }

    var price: String {
        return item.price
    }

    var isFavorite: Bool {
        return item.isFavorite
    }

    var isInBag: Bool {
        return item.isInBag
    }
}
