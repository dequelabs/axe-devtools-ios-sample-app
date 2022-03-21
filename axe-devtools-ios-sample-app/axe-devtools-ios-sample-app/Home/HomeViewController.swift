//
//  HomeViewController.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/14/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var baseScrollView: BaseScrollView = {
        let bsv = BaseScrollView()
        bsv.translatesAutoresizingMaskIntoConstraints = false
        return bsv
    }()

    lazy var searchBarView: SearchBarView = {
        let sbv = SearchBarView()
        sbv.translatesAutoresizingMaskIntoConstraints = false
        return sbv
    }()

    lazy var homeView: HomeView = {
        let hv = HomeView()
        hv.translatesAutoresizingMaskIntoConstraints = false
        return hv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }

    override func viewWillAppear(_ animated: Bool) {
        buildView()
    }

    private func buildView() {
        self.view.addSubview(baseScrollView)
        baseScrollView.addSubview(searchBarView)
        baseScrollView.addSubview(homeView)

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
            self.searchBarView.topAnchor.constraint(equalTo: self.baseScrollView.topAnchor),
            self.searchBarView.leadingAnchor.constraint(equalTo: self.baseScrollView.leadingAnchor),
            self.searchBarView.widthAnchor.constraint(equalTo: self.baseScrollView.widthAnchor),
            self.searchBarView.trailingAnchor.constraint(equalTo: self.baseScrollView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.homeView.topAnchor.constraint(equalTo: self.searchBarView.bottomAnchor, constant: 16),
            self.homeView.leadingAnchor.constraint(equalTo: self.baseScrollView.leadingAnchor, constant: 24),
            self.homeView.trailingAnchor.constraint(equalTo: self.baseScrollView.trailingAnchor, constant: -24),
            self.homeView.heightAnchor.constraint(equalTo: self.baseScrollView.heightAnchor)
        ])
    }
}
