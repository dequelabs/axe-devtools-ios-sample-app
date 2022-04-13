//
//  CollectionsView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/15/22.
//

import Foundation
import UIKit

class AllCollectionsView: UIView {

    let viewModel = SeasonalCollectionsViewModel()

    lazy var titleLabel: UILabel = {
        let l = UILabel()
        let italiana = UIFont(name: "Italiana-Regular", size: 32)
        l.font = italiana
        l.numberOfLines = 0
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

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
        self.translatesAutoresizingMaskIntoConstraints = false
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildView() {
        self.backgroundColor = UIColor(named: "LightGray")
        self.addSubview(titleLabel)
        self.addSubview(allCollectionsVerticalStackView)

        viewModel.allCollections.forEach { collection in
            let collection = CollectionModel(name: collection.name, imageName: collection.imageName)
            let seasonalCollectionView = SeasonalCollectionView(viewModel: CollectionViewModel(model: collection))
            allCollectionsVerticalStackView.addArrangedSubview(seasonalCollectionView)
        }

        titleLabel.text = viewModel.title
        updateConstraints()
    }

    override func updateConstraints() {
        super.updateConstraints()

        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24)
        ])

        NSLayoutConstraint.activate([
            self.allCollectionsVerticalStackView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 16),
            self.allCollectionsVerticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            self.allCollectionsVerticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            self.allCollectionsVerticalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
