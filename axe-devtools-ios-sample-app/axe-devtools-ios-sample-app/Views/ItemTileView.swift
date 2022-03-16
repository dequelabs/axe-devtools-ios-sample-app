//
//  ItemTileView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/15/22.
//

import UIKit

class ItemTileView: UIView {
    
    var viewModel: ItemViewModel

    lazy var itemImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: viewModel.imageName)
        iv.image = image
        return iv
    }()

    lazy var verticalEncapsulatingStack: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 8
        return sv
    }()

    lazy var verticalTextLabelsStack: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.spacing = 4
        return sv
    }()

    lazy var itemNameLabel: UILabel = {
        let l = UILabel()
        l.text = viewModel.name
        l.font = UIFont.systemFont(ofSize: 14)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    lazy var priceLabel: UILabel = {
        let l = UILabel()
        l.text = viewModel.price
        l.font = UIFont.boldSystemFont(ofSize: 18)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    lazy var horizontalStack: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 8
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    lazy var addToBagButton: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        var imageName = viewModel.isInBag ? "bag_shop_bold" : "bag_shop"
        b.imageView?.image = UIImage(named: imageName)
        return b
    }()

    init(viewModel: ItemViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)

        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buildView() {
        self.addSubview(verticalEncapsulatingStack)
        verticalEncapsulatingStack.addArrangedSubview(itemImageView)

        verticalTextLabelsStack.addArrangedSubview(itemNameLabel)
        verticalTextLabelsStack.addArrangedSubview(priceLabel)

        horizontalStack.addArrangedSubview(addToBagButton)
        horizontalStack.addArrangedSubview(verticalTextLabelsStack)

        verticalEncapsulatingStack.addArrangedSubview(horizontalStack)

        updateConstraints()
    }

    override func updateConstraints() {
        super.updateConstraints()

        NSLayoutConstraint.activate([
            itemImageView.topAnchor.constraint(equalTo: verticalEncapsulatingStack.topAnchor),
            itemImageView.leadingAnchor.constraint(equalTo: verticalEncapsulatingStack.leadingAnchor),
            itemImageView.trailingAnchor.constraint(equalTo: verticalEncapsulatingStack.trailingAnchor),
            itemImageView.centerXAnchor.constraint(equalTo: verticalEncapsulatingStack.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            itemNameLabel.topAnchor.constraint(equalTo: verticalTextLabelsStack.topAnchor),
            itemNameLabel.leadingAnchor.constraint(equalTo: verticalTextLabelsStack.leadingAnchor),
            itemNameLabel.trailingAnchor.constraint(equalTo: verticalTextLabelsStack.trailingAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: itemNameLabel.leadingAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: verticalTextLabelsStack.bottomAnchor)

        ])

        NSLayoutConstraint.activate([
            addToBagButton.topAnchor.constraint(equalTo: horizontalStack.topAnchor),
            addToBagButton.trailingAnchor.constraint(equalTo: horizontalStack.trailingAnchor),
            addToBagButton.bottomAnchor.constraint(equalTo: horizontalStack.bottomAnchor)
        ])

    }

}
