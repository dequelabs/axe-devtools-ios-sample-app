//
//  MostPopularModel.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/14/22.
//

import Foundation

class MostPopularModel {
    var sectionTitle = "Most Popular"
    var items: [ItemModel]

    init(items: [ItemModel]) {
        self.items = items
    }
}
