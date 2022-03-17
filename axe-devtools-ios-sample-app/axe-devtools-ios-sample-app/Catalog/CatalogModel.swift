//
//  CatalogModel.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/17/22.
//

import Foundation

class CatalogModel {
    var tabTitle = "Catalog"
    var iconName = "category"
    var items: [ItemModel]
    
    init(items: [ItemModel]) {
        self.items = items
    }
}
