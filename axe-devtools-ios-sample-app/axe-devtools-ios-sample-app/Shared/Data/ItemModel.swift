//
//  ItemModel.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/14/22.
//

import Foundation
import UIKit

class ItemModel {
    var name: String
    var imageName: String
    var price: String
    var isFavorite: Bool = false
    var isInBag: Bool = false


    init(name: String,
         imageName: String,
         price: String,
         isFavorite: Bool = false,
         isInBag: Bool = false) {
        self.name = name
        self.imageName = imageName
        self.price = price
        self.isFavorite = isFavorite
        self.isInBag = isInBag
    }

    var heartImageName: String {
        return isFavorite ? "Heart_Bold" : "Heart"
    }
}
