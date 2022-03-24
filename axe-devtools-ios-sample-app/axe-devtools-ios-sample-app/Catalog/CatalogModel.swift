//
//  CatalogModel.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/17/22.
//

import Foundation

class CatalogModel {
    var tabTitle = "Catalog"
    var iconName = "Category"
    var itemTypes: [ItemTypeModel]

    var categories: [String] {
        return ["All", "Male", "Female", "Boy", "Girl", "Baby"]
    }

    var mainImageName: String {
        return "catalog_hero"
    }

    var mainImageText: String {
        return "New Collection".uppercased()
    }

    var dotsImageName: String {
        return "Dots"
    }

    init(itemTypes: [ItemTypeModel]) {
        self.itemTypes = itemTypes
    }
}
