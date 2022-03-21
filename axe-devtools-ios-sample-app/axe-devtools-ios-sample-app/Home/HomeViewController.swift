//
//  HomeViewController.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/14/22.
//

import UIKit

class HomeViewController: UIViewController {

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

    let containingView = UIView()
    let scrollView = UIScrollView()
    private func buildView() {
        containingView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(containingView)

        scrollView.translatesAutoresizingMaskIntoConstraints = false

        containingView.addSubview(scrollView)
        self.scrollView.addSubview(searchBarView)
        self.scrollView.addSubview(homeView)

        updateViewConstraints()
    }

    override func updateViewConstraints() {
        super.updateViewConstraints()
        NSLayoutConstraint.activate([
            containingView.topAnchor.constraint(equalTo: self.view.topAnchor),
            containingView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            containingView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            containingView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
     //       containingView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        //    containingView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
          //  containingView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
          //  containingView.heightAnchor.constraint(equalTo: self.view.heightAnchor)
        ])

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.containingView.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.containingView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.containingView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.containingView.bottomAnchor),
            scrollView.centerXAnchor.constraint(equalTo: self.containingView.centerXAnchor),
            scrollView.centerYAnchor.constraint(equalTo: self.containingView.centerYAnchor),
            scrollView.widthAnchor.constraint(equalTo: self.containingView.widthAnchor),
            scrollView.heightAnchor.constraint(equalTo: self.containingView.heightAnchor)
        ])
        NSLayoutConstraint.activate([
            self.searchBarView.topAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.topAnchor, constant: 16),
            self.searchBarView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.searchBarView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            self.searchBarView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.homeView.topAnchor.constraint(equalTo: self.searchBarView.bottomAnchor, constant: 16),
            self.homeView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 24),
            self.homeView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: -24),
            self.homeView.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor)
        ])
    }
}
