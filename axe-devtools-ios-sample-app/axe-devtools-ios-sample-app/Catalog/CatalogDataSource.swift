//
//  CatalogDataSource.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/22/22.
//

import Foundation

class CatalogDataSource {
    let catalog = CatalogModel(itemTypes: ItemTypeDataSource().allTypes)
}

class CategoryDataSource {
    let all = CategoryModel(name: "All")
    let male = CategoryModel(name: "Male")
    let female = CategoryModel(name: "Female")
    let boy = CategoryModel(name: "Boy")
    let girl = CategoryModel(name: "Girl")
    let baby = CategoryModel(name: "Baby")

    var allCategories: [CategoryModel] {
        return [all, male, female, boy, girl, baby]
    }
}
