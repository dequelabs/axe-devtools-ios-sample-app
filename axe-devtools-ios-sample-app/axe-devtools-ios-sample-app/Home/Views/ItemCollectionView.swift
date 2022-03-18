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
    private let itemsPerRow: CGFloat = 2

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: UICollectionViewFlowLayout())
        self.dataSource = self
        self.delegate = self
        self.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ItemCollectionViewCell
        cell.viewModel = ItemCellViewModel(item: viewModel.items[indexPath.item])
        return cell
    }

    private let sectionInsets = UIEdgeInsets(top: 50.0,
                                             left: 20.0,
                                             bottom: 50.0,
                                             right: 20.0)



    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
      let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
      let availableWidth = self.frame.width - paddingSpace
      let widthPerItem = availableWidth / itemsPerRow

      return CGSize(width: widthPerItem, height: widthPerItem)
    }

}
