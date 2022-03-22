//
//  CartViewViewController.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/21/22.
//

import UIKit

class CartViewViewController: UIViewController {
    
    var baseScrollView = BaseScrollView()
    var cartView = CartView()

    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
    }

    private func buildView() {
        self.navigationController?.isNavigationBarHidden = true
        self.view.addSubview(baseScrollView)
        baseScrollView.translatesAutoresizingMaskIntoConstraints = false
        cartView.translatesAutoresizingMaskIntoConstraints = false
        baseScrollView.addSubview(cartView)

        updateViewConstraints()
    }

    override func updateViewConstraints() {
        super.updateViewConstraints()

        NSLayoutConstraint.activate([
            baseScrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            baseScrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            baseScrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            baseScrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            cartView.topAnchor.constraint(equalTo: self.baseScrollView.topAnchor, constant: 24),
            cartView.leadingAnchor.constraint(equalTo: self.baseScrollView.leadingAnchor),
            cartView.trailingAnchor.constraint(equalTo: self.baseScrollView.trailingAnchor),
            cartView.bottomAnchor.constraint(equalTo: self.baseScrollView.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
