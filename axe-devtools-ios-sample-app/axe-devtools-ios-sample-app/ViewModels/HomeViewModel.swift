//
//  HomeViewModel.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/14/22.
//

import Foundation

class HomeViewModel {
    // things that will live here...

        // item data
            /// price
            /// item name
            /// item photo name
            /// is favorite
            /// is in bag

    // recommended items data 
    // most popular items data

    private var homeModel = HomeScreenModel()
    var headerVM = HeaderViewModel()

    var tabTitle: String {
        return homeModel.tabTitle
    }

    var imageName: String {
        return homeModel.tabImageName
    }
}
