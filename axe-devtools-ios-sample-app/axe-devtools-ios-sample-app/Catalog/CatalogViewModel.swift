//
//  CatalogViewModel.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/17/22.
//

import Foundation

class CatalogViewModel {
    let sectionTitle = "Catalog"
    private var catalogModel = CatalogModel(items: ItemDataSource().allItems)

    var title: String {
        return catalogModel.tabTitle
    }

    var iconName: String {
        return catalogModel.iconName
    }

    lazy var items: [ItemModel] = {
        return catalogModel.items
    }()
}
