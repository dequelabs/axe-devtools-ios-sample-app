//
//  MostPopularItemsViewModel.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/15/22.
//

import Foundation

class MostPopularItemsViewModel {
    var title = "Most Popular"
    private var popularItemsModel = MostPopularItemsViewModel()
    lazy var items: [ItemModel] = {
        return popularItemsModel.items
    }()
}
