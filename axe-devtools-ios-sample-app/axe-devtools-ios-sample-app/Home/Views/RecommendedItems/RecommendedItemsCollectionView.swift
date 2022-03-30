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
    private let headerId = "Header"
    let headerView = RecommendedItemsHeaderView()

    let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        return layout
    }()

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: flowLayout)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.dataSource = self
        self.delegate = self
        self.register(RecommendedItemCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.register(RecommendedItemsHeaderView.self, forSupplementaryViewOfKind:
                        UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        self.automaticallyAdjustsScrollIndicatorInsets = false

        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        if let flowLayout = self.collectionViewLayout as? UICollectionViewFlowLayout {
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

        cell.layer.cornerRadius = 10
        cell.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.frame.width, height: 80)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! RecommendedItemsHeaderView
        return headerView
    }


    private let sectionInsets = UIEdgeInsets(top: 16,
                                             left: 8,
                                             bottom: 0,
                                             right: 8)
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let allItems = CGFloat(viewModel.items.count)
        let paddingSpace = sectionInsets.left * (allItems + 1)
        let availableWidth = self.frame.width - paddingSpace
        let widthPerItem = availableWidth / allItems

        return CGSize(width: widthPerItem, height: widthPerItem)
    }

}
