//
//  CollectionsViewModel.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/15/22.
//

import Foundation

class CollectionViewModel {
    let title = "Collection"
    
    private let dataSource = CollectionsDataSource()

    lazy var allCollections: [CollectionModel] = {
        dataSource.allCollections
    }()
}
