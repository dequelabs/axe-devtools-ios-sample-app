//
//  RecommendedItemCollectionViewCell.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/28/22.
//

import UIKit

class RecommendedItemCollectionViewCell: ItemCollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateConstraints()
        self.backgroundColor = UIColor(named: "LightGray")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func updateConstraints() {
        super.updateConstraints()

        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 248),
            imageView.widthAnchor.constraint(equalToConstant: 210)
        ])
    }
}
