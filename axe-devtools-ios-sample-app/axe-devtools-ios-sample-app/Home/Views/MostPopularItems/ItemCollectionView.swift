//
//  ItemCollectionView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/18/22.
//

import UIKit

class ItemCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var viewModel = MostPopularItemsViewModel()
    private let reuseIdentifier = "ItemCell"
    private let headerId = "Header"
    let headerView = MostPopularItemsHeaderView()
    let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        return layout
    }()
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: UICollectionViewLayout())
        self.dataSource = self
        self.delegate = self
        self.automaticallyAdjustsScrollIndicatorInsets = false
        self.backgroundColor = UIColor(named: "LightGray")
      //  layout.invalidateLayout()
        registerElements()
        collectionViewLayout = createLayout()

      //  setCollectionViewLayout(createLayout(), animated: true)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func registerElements() {
        self.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.register(MostPopularItemsHeaderView.self, forSupplementaryViewOfKind:
                        UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.items.count
    }

    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    //        return CGSize(width: self.frame.width, height: 80)
    //    }

//        private let sectionInsets = UIEdgeInsets(top: 16,
//                                                 left: 8,
//                                                 bottom: 0,
//                                                 right: 8)

    //    func collectionView(_ collectionView: UICollectionView,
    //                        layout collectionViewLayout: UICollectionViewLayout,
    //                        sizeForItemAt indexPath: IndexPath) -> CGSize {
    //        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
    //        let availableWidth = self.frame.width - paddingSpace
    //        let widthPerItem = availableWidth / itemsPerRow
    //
    //        let totalItems = CGFloat(viewModel.items.count)
    //        let verticalPadding = sectionInsets.top * (totalItems  + 1)
    //        // let verticalPadding = sectionInsets.top * (totalItems / (itemsPerRow + 1))
    //        let availableHeight = self.frame.height - verticalPadding
    //        let heightPerItem = availableHeight / itemsPerRow
    //
    //        return CGSize(width: widthPerItem, height: heightPerItem)
    //    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ItemCollectionViewCell
        let item = self.viewModel.items[indexPath.row]
        cell.contentView.isUserInteractionEnabled = false
        cell.viewModel = ItemCellViewModel(item: item)
        cell.layer.cornerRadius = 10
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! MostPopularItemsHeaderView
        return headerView
    }
}

extension ItemCollectionView {
    func createLayout() -> UICollectionViewLayout {
        let sectionProvider = { (sectionIndex: Int,
                                 layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .estimated(180))

            let item = NSCollectionLayoutItem(layoutSize: itemSize)

//            item.contentInsets = NSDirectionalEdgeInsets(top: 0,
//                                                         leading: 0,
//                                                         bottom: -12,
//                                                         trailing: 0)

            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: .fractionalHeight(0.8))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                           subitem: item,
                                                           count: 2)

            let spacing = CGFloat(24)
            group.interItemSpacing = .fixed(spacing)

            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 0
            section.contentInsets = NSDirectionalEdgeInsets(top: 40,
                                                            leading: 24,
                                                            bottom: 0,
                                                            trailing: 24)

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
        config.interSectionSpacing = 0

        let layout = UICollectionViewCompositionalLayout(
            sectionProvider: sectionProvider, configuration: config)
        return layout
    }
}
