//
//  CatalogViewController.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/17/22.
//

import UIKit

class CatalogViewController: UIViewController {

    lazy var baseScrollView: BaseScrollView = {
        let bsv = BaseScrollView()
        bsv.translatesAutoresizingMaskIntoConstraints = false
        return bsv
    }()

    lazy var catalogView: CatalogView = {
        let cv = CatalogView()
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
        baseScrollView.addSubview(catalogView)

        updateViewConstraints()
    }

    override func updateViewConstraints() {
        super.updateViewConstraints()

        NSLayoutConstraint.activate([
            baseScrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            baseScrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            baseScrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            baseScrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            baseScrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            baseScrollView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            catalogView.topAnchor.constraint(equalTo: self.baseScrollView.topAnchor, constant: 24),
            catalogView.leadingAnchor.constraint(equalTo: self.baseScrollView.leadingAnchor),
            catalogView.trailingAnchor.constraint(equalTo: self.baseScrollView.trailingAnchor),
            catalogView.bottomAnchor.constraint(equalTo: self.baseScrollView.bottomAnchor),

        ])
    }
}
