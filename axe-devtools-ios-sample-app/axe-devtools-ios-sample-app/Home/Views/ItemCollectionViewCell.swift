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
        iv.contentMode = .scaleAspectFit
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
        l.text = viewModel?.itemName
        return l
    }()

    lazy var priceLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = viewModel?.itemPrice
        return l
    }()

    lazy var horizontalStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 8
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    lazy var addToBagButton: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        let imageName = viewModel!.isInBag ? "bag_shop_bold" : "bag_shop"
        b.imageView?.image = UIImage(named: imageName)
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



    private func buildCell() {
        self.addSubview(imageView)
        self.addSubview(textVerticalStackView)
        self.addSubview(horizontalStackView)

        textVerticalStackView.addArrangedSubview(itemLabel)
        textVerticalStackView.addArrangedSubview(priceLabel)

        guard let viewModel = viewModel else { return }
        imageView.image = UIImage(named: viewModel.imageName)
        updateConstraints()
    }

    override func updateConstraints() {
        super.updateConstraints()

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 180),
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])

        // make text stackview
        NSLayoutConstraint.activate([
            self.textVerticalStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            self.textVerticalStackView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            self.textVerticalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
