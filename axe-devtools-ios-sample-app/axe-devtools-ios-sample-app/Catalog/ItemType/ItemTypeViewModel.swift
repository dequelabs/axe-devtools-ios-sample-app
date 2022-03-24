//
//  ItemTypeViewModel.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/22/22.
//

import Foundation

class ItemTypeViewModel {

    var itemType: ItemTypeModel

    init(itemType: ItemTypeModel) {
        self.itemType = itemType
    }

    var typeName: String {
        return itemType.name
    }

    var subtitle: String {
        return itemType.subtitle
    }

    var images: [String] {
        return itemType.images
    }
}
