//
//  CartQuantityStepper.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/22/22.
//

import UIKit

class CartCheckoutFooterView: UIView {

    let viewModel = CartViewModel()
    
    lazy var itemsLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .lightGray
        l.numberOfLines = 0
        l.font = UIFont(name: "Gilroy-ExtraBold", size: 14)
        l.text = "Total (\(viewModel.currentCart.items.count) items):"
        return l
    }()

    lazy var priceLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.numberOfLines = 0
        l.text = viewModel.price
        l.font = UIFont(name: "Gilroy-ExtraBold", size: 18)
        l.textColor = .white
        return l
    }()

    lazy var checkoutButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(named: viewModel.imageName)
        configuration.imagePlacement = .trailing
        let b = UIButton(configuration: configuration)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.titleLabel?.textColor = .white
        b.titleLabel?.font = UIFont(name: "Gilroy-ExtraBold", size: 14)
        b.setTitle("Proceed to checkout ", for: .normal)
        b.tintColor = .white
        return b
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buildView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .black
        self.addSubview(itemsLabel)
        self.addSubview(priceLabel)
        self.addSubview(checkoutButton)

        updateConstraints()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        self.layer.cornerRadius = 10
        self.checkoutButton.layer.cornerRadius = 15
        self.checkoutButton.layer.borderWidth = 2
        self.checkoutButton.layer.borderColor = UIColor.white.cgColor
    }

    override func updateConstraints() {
        super.updateConstraints()

        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: 375),
            self.heightAnchor.constraint(equalToConstant: 118)
        ])
        
        NSLayoutConstraint.activate([
            itemsLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 18),
            itemsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24)
        ])

        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 18),
            priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24)
        ])

        NSLayoutConstraint.activate([
            checkoutButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            checkoutButton.widthAnchor.constraint(equalToConstant: 327),
            checkoutButton.heightAnchor.constraint(equalToConstant: 40),
            checkoutButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
