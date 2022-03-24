//
//  CatalogViewController.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/17/22.
//

import UIKit

class CatalogViewController: UIViewController {

    var catalogView = CatalogView()

    lazy var baseScrollView: BaseScrollView = {
        let bsv = BaseScrollView()
        bsv.translatesAutoresizingMaskIntoConstraints = false
        return bsv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
    }

    private func buildView() {
        self.navigationController?.isNavigationBarHidden = true

        self.view.addSubview(baseScrollView)
        baseScrollView.addSubview(catalogView)

        baseScrollView.translatesAutoresizingMaskIntoConstraints = false
        catalogView.translatesAutoresizingMaskIntoConstraints = false

        updateViewConstraints()
    }

    override func updateViewConstraints() {
        super.updateViewConstraints()

        NSLayoutConstraint.activate([
            baseScrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            baseScrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            baseScrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            baseScrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
           // baseScrollView.heightAnchor.constraint(equalTo: self.view.heightAnchor),
           // baseScrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor)
        ])

        NSLayoutConstraint.activate([
            catalogView.topAnchor.constraint(equalTo: self.baseScrollView.topAnchor, constant: 24),
            catalogView.leadingAnchor.constraint(equalTo: self.baseScrollView.leadingAnchor),
            catalogView.trailingAnchor.constraint(equalTo: self.baseScrollView.trailingAnchor),
            catalogView.bottomAnchor.constraint(equalTo: self.baseScrollView.bottomAnchor)
        ])
    }

}
