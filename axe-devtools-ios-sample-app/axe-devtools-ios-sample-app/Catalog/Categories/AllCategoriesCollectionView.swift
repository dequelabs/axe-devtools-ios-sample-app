//
//  AllCategoriesCollectionView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/30/22.
//

import UIKit

class AllCategoriesCollectionView: UICollectionView {

    var viewModel: CategoryCellViewModel? {
        didSet {
            buildCell()
        }
    }

    private func buildCell() {
        
    }
}
