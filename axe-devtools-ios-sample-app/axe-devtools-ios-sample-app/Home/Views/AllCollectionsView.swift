//
//  CollectionsView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/15/22.
//

import Foundation
import UIKit

class AllCollectionsView: UIView {

    let viewModel = CollectionViewModel()

    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    lazy var allCollectionsVerticalStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 16
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildView() {
        self.addSubview(allCollectionsVerticalStackView)

        viewModel.allCollections.forEach { collection in

        }

        updateConstraints()
    }

    override func updateConstraints() {
        super.updateConstraints()

        NSLayoutConstraint.activate([
            self.allCollectionsVerticalStackView.topAnchor.constraint(equalTo: self.topAnchor),
            self.allCollectionsVerticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            self.allCollectionsVerticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 24),
            self.allCollectionsVerticalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}
