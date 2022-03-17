//
//  CollectionsDataSource.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/15/22.
//

import Foundation

class CollectionsDataSource {
    lazy var winterCollection: CollectionModel = {
        let winter = CollectionModel(name: "Winter 2021", imageName: "winter")
        return winter
    }()

    lazy var springCollection: CollectionModel = {
        let winter = CollectionModel(name: "Spring 2021", imageName: "spring")
        return winter
    }()

    lazy var summerCollection: CollectionModel = {
        let winter = CollectionModel(name: "Summer 2021", imageName: "summer")
        return winter
    }()

    lazy var allCollections: [CollectionModel] = {
        return [winterCollection, springCollection, summerCollection]
    }()
}
