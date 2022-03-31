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

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: UICollectionViewLayout())
        self.translatesAutoresizingMaskIntoConstraints = false
        self.dataSource = self
        self.delegate = self
        self.register(RecommendedItemCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.register(RecommendedItemsHeaderView.self, forSupplementaryViewOfKind:
                        UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        self.automaticallyAdjustsScrollIndicatorInsets = false
        self.backgroundColor = UIColor(named: "LightGray")

        collectionViewLayout = createLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! RecommendedItemCollectionViewCell
        let item = self.viewModel.items[indexPath.row]

        cell.viewModel = ItemCellViewModel(item: item)
        cell.layer.cornerRadius = 10
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
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
        let paddingSpace = sectionInsets.top * allItems
        let availableHeight = self.frame.height - paddingSpace
        return CGSize(width: 210, height: availableHeight)
    }
}

extension RecommendedItemsCollectionView {
    func createLayout() -> UICollectionViewLayout {
        let sectionProvider = { (sectionIndex: Int,
            layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                 heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)

            // if we have the space, adapt and go 2-up + peeking 3rd item
            let groupFractionalHeight = CGFloat(layoutEnvironment.container.effectiveContentSize.height > 500 ?
                0.425 : 0.85)
            let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(210),
                                                   heightDimension: .fractionalHeight(groupFractionalHeight))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            section.interGroupSpacing = 24
            section.contentInsets = NSDirectionalEdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 20)

            let titleSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .estimated(44))
            let titleSupplementary = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: titleSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .topLeading)
            section.boundarySupplementaryItems = [titleSupplementary]
            return section
        }

        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20

        let layout = UICollectionViewCompositionalLayout(
            sectionProvider: sectionProvider, configuration: config)
        return layout
    }
}
