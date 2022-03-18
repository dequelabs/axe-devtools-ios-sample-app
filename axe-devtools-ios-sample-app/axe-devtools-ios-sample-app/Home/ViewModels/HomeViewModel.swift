//
//  HomeViewModel.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/14/22.
//

import Foundation

class HomeViewModel {
    private var homeModel = HomeScreenModel()
    var headerVM = HeaderViewModel()
    var mostPopularItemsVM = MostPopularItemsViewModel()
    var collectionsVM = CollectionViewModel()

    var tabTitle: String {
        return homeModel.tabTitle
    }

    var imageName: String {
        return homeModel.tabImageName
    }

    var popularItemCellVMs: [ItemCellViewModel] = []
}
