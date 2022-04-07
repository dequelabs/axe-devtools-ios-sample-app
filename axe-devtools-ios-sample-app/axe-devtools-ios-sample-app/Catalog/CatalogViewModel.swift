//
//  CatalogViewModel.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/17/22.
//

import Foundation

class CatalogViewModel {

    let sectionTitle = "Catalog"
    private var
    catalogModel = CatalogDataSource().catalog

    var title: String {
        return catalogModel.tabTitle
    }

    var iconName: String {
        return catalogModel.iconName
    }

    var mainImageName: String {
        return catalogModel.mainImageName
    }

    var mainImageText: String {
        return catalogModel.mainImageText
    }

    var dotsImageName: String {
        return catalogModel.dotsImageName
    }
    
    var categories: [CategoryModel] {
        return catalogModel.categories
}

    var itemTypes: [ItemTypeModel] {
        return catalogModel.itemTypes
    }

    var selectedImage: String {
        return catalogModel.selectedImage
    }
}
