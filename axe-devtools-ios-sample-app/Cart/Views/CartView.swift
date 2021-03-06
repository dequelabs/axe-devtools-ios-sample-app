//
//  CartView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/21/22.
//

import UIKit

class CartView: UIView {

    let viewModel = CartViewModel()

    lazy var titleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.numberOfLines = 0
        l.text = viewModel.title
        let gilroy = UIFont(name: "Italiana-Regular", size: 32)
        l.font = gilroy
        return l
    }()

    lazy var verticalStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 16
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    lazy var deleteButton: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle(viewModel.deleteButtonText, for: .normal)
        b.setTitleColor(.red, for: .normal)
        let gilroy = UIFont(name: "Gilroy-ExtraBold", size: 14)
        b.titleLabel?.font = gilroy
        return b
    }()

    lazy var checkoutFooterView: CartCheckoutFooterView = {
        let cv = CartCheckoutFooterView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
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
        
        self.addSubview(titleLabel)
        self.addSubview(verticalStackView)
        self.addSubview(deleteButton)
        self.addSubview(checkoutFooterView)

        buildItemsView()
        updateConstraints()
    }

    private func buildItemsView() {
        viewModel.items.forEach { item in
            let vm = ItemViewModel(item: item)
            verticalStackView.addArrangedSubview(CartItemView(viewModel: vm))
        }
    }

    override func updateConstraints() {
        super.updateConstraints()

        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            verticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            verticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            verticalStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 60),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            deleteButton.topAnchor.constraint(equalTo: verticalStackView.bottomAnchor, constant: 24),
            deleteButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            deleteButton.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])

        NSLayoutConstraint.activate([
            checkoutFooterView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            checkoutFooterView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            checkoutFooterView.widthAnchor.constraint(equalTo: self.widthAnchor),
            checkoutFooterView.heightAnchor.constraint(equalToConstant: 118),
            checkoutFooterView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
