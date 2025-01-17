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
        let italiana = UIFont(name: "Italiana-Regular", size: 24)
        l.font = italiana
        return l
    }()

    lazy var subtitleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        let gilroy = UIFont(name: "Gilroy-Light", size: 14)
        l.font = gilroy
        return l
    }()

    lazy var itemImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
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
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameLabel)
        self.addSubview(subtitleLabel)
        self.addSubview(itemImage)

        self.layer.cornerRadius = 10
        self.backgroundColor = .lightGray
        
        itemImage.image = UIImage(named: viewModel.imageName)
        nameLabel.text = viewModel.typeName
        subtitleLabel.text = viewModel.subtitle

        updateConstraints()
    }

    override func updateConstraints() {
        super.updateConstraints()

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 19),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            nameLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 24)
        ])

        NSLayoutConstraint.activate([
            subtitleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 16),
            subtitleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            subtitleLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            subtitleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -19)
        ])

        if viewModel.typeName == "Accessories" {
            let accessoriesSecondImage = UIImage(named: "necktie")
            let imageView = UIImageView(image: accessoriesSecondImage)
            imageView.translatesAutoresizingMaskIntoConstraints = false

            itemImage.addSubview(imageView)

            let accessoriesImagesConstraints = [
                itemImage.topAnchor.constraint(equalTo: self.topAnchor, constant: -8),
                itemImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                itemImage.widthAnchor.constraint(equalToConstant: 90),
                imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: -8),
                imageView.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 4),
                imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -6),
                imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                imageView.widthAnchor.constraint(equalToConstant: 16)
            ]

            NSLayoutConstraint.activate(accessoriesImagesConstraints)
        } else {
            NSLayoutConstraint.activate([
                itemImage.topAnchor.constraint(equalTo: self.topAnchor, constant: -8),
                itemImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -34),
                itemImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                itemImage.heightAnchor.constraint(equalToConstant: 100),
                itemImage.widthAnchor.constraint(equalToConstant: 90)
            ])
        }
    }
}
