//
//  TableRowViewModel.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/25/22.
//

import Foundation

class TableRowViewModel {
    var model: TableRowModel

    init(model: TableRowModel) {
        self.model = model
    }

    var text: String {
        return model.text
    }

    var imageName: String {
        return model.imageName
    }
}
