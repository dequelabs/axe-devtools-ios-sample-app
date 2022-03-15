//
//  ItemTileView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/15/22.
//

import UIKit

class ItemTileView: UIView {
    var viewModel: ItemViewModel

    init(viewModel: ItemViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
