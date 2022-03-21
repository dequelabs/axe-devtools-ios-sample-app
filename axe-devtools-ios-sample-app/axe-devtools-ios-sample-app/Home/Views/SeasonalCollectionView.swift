//
//  SeasonalCollectionView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/21/22.
//

import UIKit

class SeasonalCollectionView: UIView {
    var viewModel = CollectionViewModel()

    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        let image = viewModel.
        return iv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buildView() {

        updateConstraints()
    }

    override func updateConstraints() {
        super.updateConstraints()
    }
}
