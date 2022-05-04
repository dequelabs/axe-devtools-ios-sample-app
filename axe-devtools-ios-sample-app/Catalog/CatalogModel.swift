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

    var categories: [CategoryModel] {
        return CategoryDataSource().allCategories
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

    var selectedImage: String {
        return "CategorySelected"
    }

    init(itemTypes: [ItemTypeModel]) {
        self.itemTypes = itemTypes
    }
}
