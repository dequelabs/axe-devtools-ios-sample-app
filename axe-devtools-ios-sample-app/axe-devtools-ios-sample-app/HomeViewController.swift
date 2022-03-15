//
//  HomeViewController.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/14/22.
//

import UIKit

class HomeViewController: UIViewController {

    var homeView: HomeView = {
        let hv = HomeView()
        hv.translatesAutoresizingMaskIntoConstraints = false
        return hv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(homeView)
        homeView.backgroundColor = .orange
    }

    override func viewWillAppear(_ animated: Bool) {
        buildView()
    }

    private func buildView() {

        NSLayoutConstraint.activate([
            self.homeView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.homeView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.homeView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.homeView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}
