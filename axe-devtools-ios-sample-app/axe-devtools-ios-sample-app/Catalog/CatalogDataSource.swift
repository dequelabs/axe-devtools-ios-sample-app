//
//  CatalogDataSource.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/22/22.
//

import Foundation

class CatalogDataSource {
    let catalog = CatalogModel(itemTypes: ItemTypeDataSource().allTypes)
}
