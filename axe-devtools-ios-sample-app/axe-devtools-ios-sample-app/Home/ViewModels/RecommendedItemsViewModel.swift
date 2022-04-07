//
//  RecommendedItemsViewModel.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/15/22.
//

import Foundation

class RecommendedItemsViewModel {
    let title = "Recommended"
    private let dataSource = ItemDataSource()

    lazy var items: [ItemModel] = {
        return dataSource.allItems
    }()
}
