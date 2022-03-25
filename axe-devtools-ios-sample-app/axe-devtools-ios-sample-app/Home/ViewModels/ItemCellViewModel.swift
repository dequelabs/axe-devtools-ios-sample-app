//
//  ItemCellViewModel.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/18/22.
//

import Foundation

class ItemCellViewModel {
    var item: ItemModel

    init(item: ItemModel) {
        self.item = item
    }

    var imageName: String {
        return item.imageName
    }

    var itemName: String {
        return item.name
    }

    var itemPrice: String {
        return item.price
    }

    var isFavorite: Bool {
        return item.isFavorite
    }

    var isInBag: Bool {
        return item.isInBag
    }

    var heartImageName: String {
        return item.heartImageName
    }
}
