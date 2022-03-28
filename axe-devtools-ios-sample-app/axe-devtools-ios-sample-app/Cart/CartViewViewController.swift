//
//  CartViewViewController.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/21/22.
//

import UIKit

class CartViewViewController: UIViewController {
    
    lazy var baseScrollView: BaseScrollView = {
        let bsv = BaseScrollView()
        bsv.translatesAutoresizingMaskIntoConstraints = false
        return bsv
    }()

    lazy var cartView: CartView = {
        let cv = CartView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
    }

    private func buildView() {
        self.navigationController?.isNavigationBarHidden = true

        self.view.addSubview(baseScrollView)
        baseScrollView.containingView.addSubview(cartView)

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
            cartView.topAnchor.constraint(equalTo: self.baseScrollView.containingView.topAnchor, constant: 24),
            cartView.leadingAnchor.constraint(equalTo: self.baseScrollView.leadingAnchor),
            cartView.trailingAnchor.constraint(equalTo: self.baseScrollView.trailingAnchor),
            cartView.bottomAnchor.constraint(equalTo: self.baseScrollView.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
