//
//  CollectionsViewModel.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/15/22.
//

import Foundation

class CollectionViewModel {
    let title = "Collection"
    
    let model: CollectionModel

    init(model: CollectionModel) {
        self.model = model
    }

    var name: String {
        return model.name
    }
    
    var imageName: String {
        return model.imageName
    }
}
