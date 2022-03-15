//
//  MostPopularItemsDataSource.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/15/22.
//

import Foundation

class MostPopularItemsDataSource {
    private var dataSource = ItemDataSource()

    lazy var items: [ItemModel] = {
        return dataSource.allItems
    }()
}
