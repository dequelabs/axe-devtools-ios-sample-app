//
//  ItemsDataSource.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/15/22.
//

import Foundation

class ItemDataSource {
    lazy var itemA: ItemModel = {
        return ItemModel(name: "Exploronic Life",
                         imageName: "a",
                         price: "$26.00")
    }()

    lazy var itemB: ItemModel = {
        return ItemModel(name: "Exploronic Life",
                         imageName: "b",
                         price: "$26.00")

    }()

    lazy var itemC: ItemModel = {
        return ItemModel(name: "Exploronic Life",
                         imageName: "c",
                         price: "$26.00")
    }()

    lazy var itemD: ItemModel = {
        return ItemModel(name: "Survive",
                         imageName: "d",
                         price: "$125.00")
    }()

    lazy var allItems: [ItemModel] = {
        return [itemA, itemB, itemC, itemD]
    }()
}
