//
//  AllCategoriesCollectionView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/30/22.
//

import UIKit

class AllCategoriesCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var viewModel = CatalogViewModel()
    private let reuseIdentifier = "ItemCell"

    let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        return layout
    }()

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: flowLayout)
        self.dataSource = self
        self.delegate = self
        self.register(CategoryCollectionCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.automaticallyAdjustsScrollIndicatorInsets = false
        self.backgroundColor = UIColor(named: "LightGray")

        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func setupLayout() {
        if let flowLayout = self.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.collectionView?.isPagingEnabled = true
            flowLayout.collectionView?.isScrollEnabled = true
            flowLayout.collectionView?.delegate = self
            flowLayout.collectionView?.dataSource = self
            flowLayout.collectionView?.showsHorizontalScrollIndicator = false
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.categories.count
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CategoryCollectionCell
        let category = self.viewModel.categories[indexPath.row]
        cell.viewModel = CategoryCellViewModel(category: category)
        cell.layer.cornerRadius = 10
        return cell
    }

    private let sectionInsets = UIEdgeInsets(top: 0,
                                             left: 8,
                                             bottom: 0,
                                             right: 8)

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalCategories = CGFloat(viewModel.categories.count)
        let paddingSpace = sectionInsets.left * 3
        let availableWidth = self.frame.width - paddingSpace
        let widthPerItem = availableWidth / totalCategories

        return CGSize(width: widthPerItem, height: 32)
    }
}
