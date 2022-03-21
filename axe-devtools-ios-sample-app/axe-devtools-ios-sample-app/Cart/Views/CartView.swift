//
//  CartView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/21/22.
//

import UIKit

class CartView: UIView {
    // has a vertical stackview of cart item views
    let viewModel = CartViewModel()
    // has delete button under stackview
    lazy var verticalStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 16
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildItemsView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func buildItemsView() {
        self.addSubview(verticalStackView)
        viewModel.items.forEach { item in
            let vm = ItemViewModel(item: item)
            verticalStackView.addArrangedSubview(CartItemView(viewModel: vm))
        }
    }

    override func updateConstraints() {
        super.updateConstraints()

        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: self.topAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    // don't forget bottom accessory 'checkout' view
}
