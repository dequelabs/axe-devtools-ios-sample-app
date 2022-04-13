//
//  ProfileViewController.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/24/22.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {

    let scrollView = UIScrollView()
    let contentView = UIView()

    
    lazy var profileView: ProfileView = {
        let pv = ProfileView()
        pv.translatesAutoresizingMaskIntoConstraints = false
        return pv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "LightGray")
        buildView()
    }

    private func buildView() {
        self.navigationController?.isNavigationBarHidden = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(profileView)
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
            profileView.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor),
            profileView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            profileView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            profileView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }
}
