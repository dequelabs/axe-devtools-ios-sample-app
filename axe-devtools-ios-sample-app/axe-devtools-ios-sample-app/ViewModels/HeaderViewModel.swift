//
//  HeaderViewModel.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/14/22.
//

import Foundation

class HeaderViewModel {

    var model = HeaderModel()

    var title: String {
        return model.headerTitle
    }

    var subtitle: String {
        return model.headerSubtitle
    }

    var buttonText: String {
        return model.buttonText
    }

    var imageName: String {
        return model.imageName
    }
}
