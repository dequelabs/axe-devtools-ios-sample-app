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
    private let itemsPerRow: CGFloat = 2
    let headerView = MostPopularItemsHeaderView()

    let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        return layout
    }()

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: flowLayout)
        self.dataSource = self
        self.delegate = self
        self.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.isScrollEnabled = false
        self.automaticallyAdjustsScrollIndicatorInsets = false
        self.register(MostPopularItemsHeaderView.self, forSupplementaryViewOfKind:
                        UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)

        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupLayout() {
        if let flowLayout = self.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .vertical
            flowLayout.collectionView?.delegate = self
            flowLayout.collectionView?.dataSource = self
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.items.count
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 12
//    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let paddingSpace = sectionInsets.top * (itemsPerRow + 1)
        let availableWidth = self.frame.height - paddingSpace
        return availableWidth / itemsPerRow
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ItemCollectionViewCell
        let item = self.viewModel.items[indexPath.row]
        cell.viewModel = ItemCellViewModel(item: item)
        cell.layer.cornerRadius = 10
        cell.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        return cell
    }

  
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! MostPopularItemsHeaderView
        return headerView
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.frame.width, height: 60)
    }

    private let sectionInsets = UIEdgeInsets(top: 12,
                                             left: 8,
                                             bottom: 0,
                                             right: 8)


    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = self.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow

        return CGSize(width: widthPerItem, height: widthPerItem)
    }
}
