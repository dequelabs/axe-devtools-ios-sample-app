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
        sv.spacing = 4
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    lazy var itemLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
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

    lazy var heartImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    lazy var addToBagButton: UIButton = {
        let b = UIButton()
        b.layer.borderColor = UIColor.black.cgColor
        return b
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        buildCell()
        self.layer.cornerRadius = 20
        imageView.layer.cornerRadius = 20
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
        imageView.addSubview(heartImageView)
        self.addSubview(horizontalStackView)
        self.horizontalStackView.addArrangedSubview(textVerticalStackView)

        horizontalStackView.addArrangedSubview(addToBagButton)
        textVerticalStackView.addArrangedSubview(itemLabel)
        textVerticalStackView.addArrangedSubview(priceLabel)

        configureElements()
        updateConstraints()
    }

    private func configureElements() {
        guard let viewModel = viewModel else { return }
        let imageName = viewModel.isInBag ? "bag_shop_bold" : "bag_shop"

        itemLabel.text = viewModel.itemName
        priceLabel.text = viewModel.itemPrice

        addToBagButton.backgroundColor = viewModel.isInBag ? .black : .white
        addToBagButton.layer.cornerRadius = 15
        addToBagButton.setImage(UIImage(named: imageName), for: .normal)

        imageView.image = UIImage(named: viewModel.imageName)
        heartImageView.image = UIImage(named: viewModel.heartImageName)
    }

    override func updateConstraints() {
        super.updateConstraints()

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 180),
            imageView.widthAnchor.constraint(equalToConstant: 150)
        ])

        NSLayoutConstraint.activate([
            heartImageView.widthAnchor.constraint(equalToConstant: 17),
            heartImageView.heightAnchor.constraint(equalToConstant: 16),
            heartImageView.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 10),
            heartImageView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -10)
        ])

        NSLayoutConstraint.activate([
            horizontalStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32),
            horizontalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            horizontalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            horizontalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            addToBagButton.widthAnchor.constraint(equalToConstant: 33),
            addToBagButton.heightAnchor.constraint(equalToConstant: 33),
            addToBagButton.centerYAnchor.constraint(equalTo: horizontalStackView.centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            textVerticalStackView.topAnchor.constraint(equalTo: horizontalStackView.topAnchor),
            textVerticalStackView.leadingAnchor.constraint(equalTo: horizontalStackView.leadingAnchor),
            textVerticalStackView.trailingAnchor.constraint(equalTo: horizontalStackView.trailingAnchor),
            textVerticalStackView.bottomAnchor.constraint(equalTo: horizontalStackView.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            itemLabel.topAnchor.constraint(equalTo: textVerticalStackView.topAnchor),
            itemLabel.leadingAnchor.constraint(equalTo: textVerticalStackView.leadingAnchor),
            itemLabel.centerYAnchor.constraint(equalTo: addToBagButton.centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            priceLabel.leadingAnchor.constraint(equalTo: textVerticalStackView.leadingAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: textVerticalStackView.bottomAnchor)
        ])
    }
}
