//
//  ItemTypeDataSource.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/22/22.
//

import Foundation

class ItemTypeDataSource {
    
    let tShirts = ItemTypeModel(name: "T-Shirts",
                                subtitle: "T-shirts for every taste",
                                imageName: "tee")
    let sweatShirts = ItemTypeModel(name: "Sweatshirts",
                                    subtitle: "Sweatshirts for every taste",
                                    imageName: "tee")
    let tankTops = ItemTypeModel(name: "Tank tops",
                                 subtitle: "Tank tops for every taste",
                                 imageName: "tank")
    let bottoms = ItemTypeModel(name: "Bottoms",
                                subtitle: "Bottoms for every taste",
                                imageName: "bottoms")
    let accessories = ItemTypeModel(name: "Accessories",
                                    subtitle: "Accessories for every taste",
                                    imageName: "handbag")

    lazy var allTypes: [ItemTypeModel] = {
        
        return [tShirts,
                sweatShirts,
                tankTops,
                bottoms,
                accessories]
    }()
}
