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
    var collectionsVM = SeasonalCollectionsViewModel()

    var tabTitle: String {
        return homeModel.tabTitle
    }

    var imageName: String {
        return homeModel.tabImageName
    }

    var selectedImage: String {
        return homeModel.selectedImage
    }

    lazy var popularItemCellVMs: [ItemCellViewModel] = {
        // we want to return an array of item cell view model's
        // we have the most popular items VM already in this class
        // create item cell VM from iterating each item in most popular VM
        var cellVMs: [ItemCellViewModel] = []

        mostPopularItemsVM.items.forEach { item in
            var vm = ItemCellViewModel(item: item)
            cellVMs.append(vm)
        }
        return cellVMs
    }()
}
