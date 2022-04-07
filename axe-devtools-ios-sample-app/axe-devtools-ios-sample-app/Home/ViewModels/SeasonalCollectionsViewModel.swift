//
//  SeasonalCollectionsViewModel.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/21/22.
//

import Foundation

class SeasonalCollectionsViewModel {
    var title = "Collection"
    private var allCollectionsModel = CollectionsDataSource()

    lazy var allCollections: [CollectionModel] = {
        return allCollectionsModel.allCollections
    }()

    func getSeasonalCollection(atIndex index: Int) -> CollectionViewModel {
        let name = allCollections[index].name
        let imageName = allCollections[index].imageName
        let collection = CollectionModel(name: name, imageName: imageName)
        return CollectionViewModel(model: collection)
    }
}
