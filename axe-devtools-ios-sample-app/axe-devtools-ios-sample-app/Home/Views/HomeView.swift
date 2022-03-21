//
//  HomeView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/14/22.
//

import UIKit

class HomeView: UIView {
    var homeVM = HomeViewModel()

    lazy var mainImageView: HomeImageView = {
        let hv = HomeImageView()
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

    lazy var recommendedItemsView: RecommendedItemsView = {
        let riv = RecommendedItemsView()
        riv.translatesAutoresizingMaskIntoConstraints = false
        return riv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildView() {
        self.addSubview(mainImageView)
        self.addSubview(mostPopularItemsView)
      //  self.addSubview(collectionsView)
      //  self.addSubview(recommendedItemsView)
        updateConstraints()
    }

        override func updateConstraints() {
        super.updateConstraints()
        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: self.topAnchor),
            mainImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])

        NSLayoutConstraint.activate([
            mostPopularItemsView.topAnchor.constraint(equalTo: self.mainImageView.bottomAnchor, constant: 24),
            mostPopularItemsView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mostPopularItemsView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mostPopularItemsView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
    }
}
