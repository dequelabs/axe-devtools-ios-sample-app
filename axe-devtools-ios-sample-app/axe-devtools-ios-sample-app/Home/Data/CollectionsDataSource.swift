//
//  CollectionsDataSource.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/15/22.
//

import Foundation

class CollectionsDataSource {
    lazy var winterCollection: CollectionsModel = {
        let winter = CollectionsModel(name: "Winter 2021", imageName: "winter")
        return winter
    }()

    lazy var springCollection: CollectionsModel = {
        let winter = CollectionsModel(name: "Spring 2021", imageName: "spring")
        return winter
    }()

    lazy var summerCollection: CollectionsModel = {
        let winter = CollectionsModel(name: "Summer 2021", imageName: "summer")
        return winter
    }()

    lazy var allCollections: [CollectionsModel] = {
        return [winterCollection, springCollection, summerCollection]
    }()
}
