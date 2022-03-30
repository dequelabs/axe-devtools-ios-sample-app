//
//  CartQuantityStepperView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/22/22.
//

import UIKit

class CartQuantityStepperView: UIView {

    let viewModel = CartViewModel()

    lazy var decrementButton: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = .black
        b.imageView?.tintColor = .white
        let decrementIcon = UIImage(named: viewModel.minusButtonImage)
        b.setImage(decrementIcon, for: .normal)
        b.layer.cornerRadius = 10
        return b
    }()

    lazy var incrementButton: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = .black
        b.imageView?.tintColor = .white
        let incrementIcon = UIImage(named: viewModel.addButtonImage)
        b.setImage(incrementIcon, for: .normal)
        b.layer.cornerRadius = 10
        return b
    }()

    lazy var quantityLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "1"
        l.font = UIFont(name: "Gilroy-ExtraBold", size: 16)
        return l
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 15
    }

    private func buildView() {
        self.addSubview(decrementButton)
        self.addSubview(quantityLabel)
        self.addSubview(incrementButton)

        updateConstraints()
    }

    override func updateConstraints() {
        super.updateConstraints()

        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: 99),
            self.heightAnchor.constraint(equalToConstant: 30)
        ])

        NSLayoutConstraint.activate([
            decrementButton.topAnchor.constraint(equalTo: self.topAnchor),
            decrementButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            decrementButton.heightAnchor.constraint(equalToConstant: 30),
            decrementButton.widthAnchor.constraint(equalToConstant: 30)
        ])

        NSLayoutConstraint.activate([
            quantityLabel.topAnchor.constraint(equalTo: self.topAnchor),
            quantityLabel.leadingAnchor.constraint(equalTo: decrementButton.trailingAnchor, constant: 16),
            quantityLabel.trailingAnchor.constraint(equalTo: incrementButton.leadingAnchor, constant: 16),
            quantityLabel.centerYAnchor.constraint(equalTo: incrementButton.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            incrementButton.topAnchor.constraint(equalTo: self.topAnchor),
            incrementButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            incrementButton.heightAnchor.constraint(equalToConstant: 30),
            incrementButton.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
}
