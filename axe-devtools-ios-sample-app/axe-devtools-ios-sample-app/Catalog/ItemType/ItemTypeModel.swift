//
//  ItemCategoryModel.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/22/22.
//

import Foundation

class ItemTypeModel {
    var name: String
    var subtitle: String
    var images: [String]

    init(name: String, subtitle: String, images: [String]) {
        self.name = name
        self.subtitle = subtitle
        self.images = images
    }
}

