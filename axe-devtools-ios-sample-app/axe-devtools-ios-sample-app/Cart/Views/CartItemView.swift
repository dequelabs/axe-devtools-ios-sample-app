//
//  CartItemView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/21/22.
//

import UIKit

class CartItemView: UIView {
    var viewModel: ItemViewModel

    lazy var textVerticalStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 4
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    lazy var itemImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    lazy var itemLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    lazy var itemColorLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    lazy var priceLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    lazy var quantityLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
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
        self.layer.cornerRadius = 15
        self.backgroundColor = .gray

        itemLabel.text = viewModel.name
        itemColorLabel.text = "Gray"
        priceLabel.text = viewModel.price

        self.addSubview(itemImageView)
        self.addSubview(textVerticalStackView)
        textVerticalStackView.addArrangedSubview(itemLabel)
        textVerticalStackView.addArrangedSubview(itemColorLabel)
        textVerticalStackView.addArrangedSubview(priceLabel)

        updateConstraints()
    }

    override func updateConstraints() {
        super.updateConstraints()
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 109),
            self.widthAnchor.constraint(equalToConstant: 327)
        ])
        
        NSLayoutConstraint.activate([
            itemImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            itemImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            itemImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 4),
            itemImageView.heightAnchor.constraint(equalToConstant: 101),
            itemImageView.widthAnchor.constraint(equalToConstant: 85)
        ])

        NSLayoutConstraint.activate([
            textVerticalStackView.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 16),
            textVerticalStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            textVerticalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 16)
        ])
    }
}
