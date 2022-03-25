//
//  ProfileViewController.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/24/22.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    lazy var profileView: ProfileView = {
        let pv = ProfileView()
        pv.translatesAutoresizingMaskIntoConstraints = false
        return pv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        buildView()
    }

    private func buildView() {
        self.navigationController?.isNavigationBarHidden = true
        self.view.addSubview(profileView)
        updateViewConstraints()
    }

    override func updateViewConstraints() {
        super.updateViewConstraints()

        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: self.view.topAnchor),
            profileView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            profileView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            profileView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}
