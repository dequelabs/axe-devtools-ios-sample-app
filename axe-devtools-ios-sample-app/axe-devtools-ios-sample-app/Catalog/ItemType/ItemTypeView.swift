//
//  ItemTypeView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/22/22.
//

import UIKit

class ItemTypeView: UIView {
    var viewModel: ItemTypeViewModel

    lazy var nameLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    lazy var subtitleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    lazy var itemImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: viewModel.imageName)
        return iv
    }()

    init(viewModel: ItemTypeViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)

        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buildView() {
        self.addSubview(nameLabel)
        self.addSubview(subtitleLabel)
        self.addSubview(itemImage)

        self.layer.cornerRadius = 10
        self.backgroundColor = .lightGray
        nameLabel.text = viewModel.typeName
        subtitleLabel.text = viewModel.subtitle
        updateConstraints()
    }

    override func updateConstraints() {
        super.updateConstraints()

        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 90),
            self.widthAnchor.constraint(equalToConstant: 327)
        ])

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 19),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32)
        ])

        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            subtitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            subtitleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -19)
        ])

        NSLayoutConstraint.activate([
            itemImage.topAnchor.constraint(equalTo: self.topAnchor, constant: -8),
            itemImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -34),
            itemImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            itemImage.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
