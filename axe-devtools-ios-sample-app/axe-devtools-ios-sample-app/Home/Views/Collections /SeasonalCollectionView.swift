//
//  SeasonalCollectionView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/21/22.
//

import UIKit

class SeasonalCollectionView: UIView {

    var viewModel: CollectionViewModel

    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: viewModel.imageName)
        iv.image = image
        return iv
    }()

    lazy var nameLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = viewModel.name
        l.textColor = .white
        return l
    }()

    init(viewModel: CollectionViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)

        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buildView() {
        self.addSubview(imageView)
        self.addSubview(nameLabel)
        updateConstraints()
    }

    override func updateConstraints() {
        super.updateConstraints()

        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 120),
            self.widthAnchor.constraint(equalToConstant: 327)
        ])

        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.imageView.heightAnchor.constraint(equalTo: self.heightAnchor),
            self.imageView.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])

        NSLayoutConstraint.activate([
            self.nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 76),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 190),
            self.nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 16)
        ])
    }
}
