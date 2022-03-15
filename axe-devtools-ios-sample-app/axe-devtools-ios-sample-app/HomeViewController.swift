//
//  HomeViewController.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/14/22.
//

import UIKit

class HomeViewController: UIViewController {

    var homeView: HeaderView {
        let hv = HeaderView()
        hv.translatesAutoresizingMaskIntoConstraints = false
        return hv
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
    }

    private func buildView() {
        self.view.addSubview(homeView)

        NSLayoutConstraint.activate([
            self.homeView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.homeView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.homeView.topAnchor.constraint(equalTo: self.view.topAnchor)
        ])
    }
}
