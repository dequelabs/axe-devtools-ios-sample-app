//
//  CatalogViewController.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/17/22.
//

import UIKit

class CatalogViewController: UIViewController {

    let scrollView = UIScrollView()
    let contentView = UIView()

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
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(catalogView)
        
        updateViewConstraints()
    }

    override func updateViewConstraints() {
        super.updateViewConstraints()

        NSLayoutConstraint.activate([
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        let contentViewCenterY = contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)

        contentViewCenterY.priority = .defaultLow
        contentViewHeight.priority = .defaultLow

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentViewCenterY,
            contentViewHeight,
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            catalogView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 24),
            catalogView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            catalogView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
           // catalogView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),

        ])
    }
}
