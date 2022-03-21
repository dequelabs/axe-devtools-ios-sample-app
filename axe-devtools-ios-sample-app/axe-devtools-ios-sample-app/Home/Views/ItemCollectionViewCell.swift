//
//  ItemCollectionCellCollectionViewCell.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/18/22.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    var viewModel: ItemCellViewModel? {
        didSet {
            buildCell()
        }
    }

    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    lazy var textVerticalStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 8
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    lazy var itemLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.backgroundColor = .orange
        return l
    }()

    lazy var priceLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.backgroundColor = .purple
        return l
    }()

    lazy var horizontalStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 12
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    lazy var addToBagButton: UIButton = {
        let b = UIButton()
        b.backgroundColor = .green
        b.translatesAutoresizingMaskIntoConstraints = false
        b.layer.borderColor = UIColor.black.cgColor
        return b
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildCell()
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.layer.cornerRadius = 20
    }

    private func buildCell() {
        self.addSubview(imageView)
        self.addSubview(horizontalStackView)
        self.horizontalStackView.addArrangedSubview(textVerticalStackView)

        textVerticalStackView.addArrangedSubview(itemLabel)
        textVerticalStackView.addArrangedSubview(priceLabel)
        horizontalStackView.addArrangedSubview(addToBagButton)

        configureElements()
        updateConstraints()
    }

    private func configureElements() {
        guard let viewModel = viewModel else { return }
        let imageName = viewModel.isInBag ? "bag_shop_bold" : "bag_shop"

        itemLabel.text = viewModel.itemName
        priceLabel.text = viewModel.itemPrice

        addToBagButton.imageView?.image = UIImage(named: imageName)
        imageView.image = UIImage(named: viewModel.imageName)
    }

    override func updateConstraints() {
        super.updateConstraints()

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 180),
            imageView.widthAnchor.constraint(equalToConstant: 150),
           // imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])


        NSLayoutConstraint.activate([
            horizontalStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 12),
            horizontalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            horizontalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            horizontalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            addToBagButton.widthAnchor.constraint(equalToConstant: 33),
            addToBagButton.heightAnchor.constraint(equalToConstant: 33)
        ])

        NSLayoutConstraint.activate([
            textVerticalStackView.topAnchor.constraint(equalTo: horizontalStackView.topAnchor),
            textVerticalStackView.leadingAnchor.constraint(equalTo: horizontalStackView.leadingAnchor),
            textVerticalStackView.trailingAnchor.constraint(equalTo: horizontalStackView.trailingAnchor),
            textVerticalStackView.centerYAnchor.constraint(equalTo: horizontalStackView.centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            itemLabel.topAnchor.constraint(equalTo: textVerticalStackView.topAnchor),
            itemLabel.leadingAnchor.constraint(equalTo: textVerticalStackView.leadingAnchor),
            itemLabel.centerYAnchor.constraint(equalTo: addToBagButton.centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: itemLabel.bottomAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: textVerticalStackView.leadingAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: horizontalStackView.bottomAnchor)
        ])
    }
}
