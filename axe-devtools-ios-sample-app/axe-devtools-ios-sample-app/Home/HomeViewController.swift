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

    lazy var homeScreenImageView: HomeScreenImageView = {
        let hv = HomeScreenImageView()
        hv.translatesAutoresizingMaskIntoConstraints = false
        return hv
    }()

    lazy var mostPopularItemsView: ItemCollectionView = {
        var mpv = ItemCollectionView()
        mpv.viewModel = MostPopularItemsViewModel()
        mpv.translatesAutoresizingMaskIntoConstraints = false
        return mpv
    }()

    lazy var collectionsView: AllCollectionsView = {
        let cv = AllCollectionsView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()

    lazy var recommendedItemsView: RecommendedItemsCollectionView = {
        let riv = RecommendedItemsCollectionView()
        riv.translatesAutoresizingMaskIntoConstraints = false
        return riv
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
        self.baseScrollView.containingView.addSubview(searchBarView)
        self.baseScrollView.containingView.addSubview(homeScreenImageView)
        self.baseScrollView.containingView.addSubview(mostPopularItemsView)
     //   self.baseScrollView.containingView.addSubview(collectionsView)
      //  self.baseScrollView.containingView.addSubview(recommendedItemsView)

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
            self.searchBarView.topAnchor.constraint(equalTo: self.baseScrollView.containingView.topAnchor),
            self.searchBarView.leadingAnchor.constraint(equalTo: self.baseScrollView.leadingAnchor),
            self.searchBarView.widthAnchor.constraint(equalToConstant: 375),
            self.searchBarView.heightAnchor.constraint(equalToConstant: 156),
            self.searchBarView.trailingAnchor.constraint(equalTo: self.baseScrollView.containingView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.homeScreenImageView.topAnchor.constraint(equalTo: self.searchBarView.bottomAnchor, constant: 16),
            self.homeScreenImageView.leadingAnchor.constraint(equalTo: self.baseScrollView
                .leadingAnchor, constant: 24),
            self.homeScreenImageView.trailingAnchor.constraint(equalTo: self.baseScrollView.trailingAnchor, constant: -24),
            self.homeScreenImageView.widthAnchor.constraint(equalToConstant: 327),
            self.homeScreenImageView.heightAnchor.constraint(equalToConstant: 327)
        ])

        NSLayoutConstraint.activate([
            mostPopularItemsView.topAnchor.constraint(equalTo: self.homeScreenImageView.bottomAnchor, constant: 32),
            mostPopularItemsView.leadingAnchor.constraint(equalTo: self.baseScrollView.leadingAnchor, constant: 24),
            mostPopularItemsView.trailingAnchor.constraint(equalTo: self.baseScrollView.trailingAnchor, constant: -24),
            mostPopularItemsView.widthAnchor.constraint(equalTo: self.baseScrollView.containingView.widthAnchor),
            mostPopularItemsView.bottomAnchor.constraint(equalTo: self.baseScrollView.safeAreaLayoutGuide.bottomAnchor)
           // mostPopularItemsView.heightAnchor.constraint(greaterThanOrEqualTo: self.baseScrollView.containingView.heightAnchor, multiplier: 0.25)
        ])

//        NSLayoutConstraint.activate([
//            collectionsView.topAnchor.constraint(equalTo: self.mostPopularItemsView.bottomAnchor, constant: 32),
//            collectionsView.leadingAnchor.constraint(equalTo: self.baseScrollView.leadingAnchor),
//            collectionsView.trailingAnchor.constraint(equalTo: self.baseScrollView.trailingAnchor),
//     //       collectionsView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.20)
//        ])

//        NSLayoutConstraint.activate([
//            recommendedItemsView.topAnchor.constraint(equalTo: self.collectionsView.bottomAnchor, constant: 24),
//            recommendedItemsView.leadingAnchor.constraint(equalTo: self.baseScrollView.leadingAnchor, constant: 24),
//            recommendedItemsView.trailingAnchor.constraint(equalTo: self.baseScrollView.trailingAnchor, constant: 24),
//            recommendedItemsView.bottomAnchor.constraint(equalTo: self.baseScrollView.containingView.bottomAnchor)
//        ])
    }
}
