//
//  RecommendedItemsView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/15/22.
//

import Foundation
import UIKit

class RecommendedItemsCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    let viewModel = RecommendedItemsViewModel()
    private let reuseIdentifier = "ItemCell"

    let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        return layout
    }()

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: flowLayout)
        self.dataSource = self
        self.delegate = self
        self.register(RecommendedItemCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.isScrollEnabled = false

        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        if let flowLayout = self.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 210.0, height: 248.0)
            flowLayout.scrollDirection = .horizontal
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! RecommendedItemCollectionViewCell
        let item = self.viewModel.items[indexPath.row]
        cell.viewModel = ItemCellViewModel(item: item)
        return cell
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }

    // dont forget to add the header

    private let sectionInsets = UIEdgeInsets(top: 16.0,
                                             left: 24.0,
                                             bottom: 0,
                                             right: 0.0)
    
}
