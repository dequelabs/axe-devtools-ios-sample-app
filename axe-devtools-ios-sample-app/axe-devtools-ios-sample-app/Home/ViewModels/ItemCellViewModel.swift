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
        get {
            return item.isFavorite
        }
        set {
            self.isFavorite = newValue
        }
    }

    var isInBag: Bool {
        get {
            return item.isInBag
        }

        set {
            self.isInBag = newValue
        }
    }

    var heartImageName: String {
        return item.heartImageName
    }
}
