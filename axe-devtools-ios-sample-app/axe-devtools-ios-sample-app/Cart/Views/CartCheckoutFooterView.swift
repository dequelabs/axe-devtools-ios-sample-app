//
//  CartQuantityStepper.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/22/22.
//

import UIKit

class CartCheckoutFooterView: UIView {

    lazy var itemsLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .lightGray
        return l
    }()

    lazy var priceLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .white
        return l
    }()

    lazy var checkoutButton: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.titleLabel?.textColor = .white
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
        self.backgroundColor = .black
        self.addSubview(itemsLabel)
        self.addSubview(priceLabel)
        self.addSubview(checkoutButton)

        updateConstraints()
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
            priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 24)
        ])

        NSLayoutConstraint.activate([
            checkoutButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 62),
            checkoutButton.widthAnchor.constraint(equalToConstant: 327),
            checkoutButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
