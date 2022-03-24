//
//  AllItemTypesViewModel.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/24/22.
//

import Foundation

class AllItemTypesViewModel {
    let itemTypes = ItemTypeDataSource().allTypes
    let tShirts = ItemTypeDataSource().tShirts
    let sweatShirts = ItemTypeDataSource().sweatShirts
    let bottoms = ItemTypeDataSource().bottoms
    let tankTops = ItemTypeDataSource().tankTops
    let accessories = ItemTypeDataSource().accessories
}
