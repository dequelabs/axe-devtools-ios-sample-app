//
//  ItemCollectionCellCollectionViewCell.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/18/22.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    var viewModel: ItemCellViewModel? {
        didSet {
            buildCell()
        }
    }
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.isUserInteractionEnabled = false
        return iv
    }()

    lazy var containingView: UIView = {
        let cv = UIView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()

    lazy var itemLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.numberOfLines = 0
        let gilroyLight = UIFont(name: "Gilroy-Light", size: 14)
        l.font = gilroyLight
        return l
    }()
    
    lazy var priceLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        let gilroyBold = UIFont(name: "Gilroy-ExtraBold", size: 18)
        l.font = gilroyBold
        l.numberOfLines = 0
        return l
    }()

    lazy var favoriteButton: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    lazy var addToBagButton: UIButton = {
        let b = UIButton()
        b.layer.borderColor = UIColor(named: "BagButtonGrayBorder")?.cgColor
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildCell()
        self.layer.cornerRadius = 20
     //   self.contentView.isUserInteractionEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.layer.cornerRadius = 20
        updateConstraints()
    }
    
    private func buildCell() {
        imageView.addSubview(favoriteButton)
        containingView.addSubview(itemLabel)
        self.addSubview(imageView)
        containingView.addSubview(priceLabel)
        self.addSubview(addToBagButton)
        self.addSubview(containingView)

        configureElements()
      //  updateConstraints()
        configureActions()
    }
    
    private func configureElements() {
        guard let viewModel = viewModel else { return }
        let imageName = viewModel.isInBag ? "bag_shop_bold" : "bag_shop"
        
        itemLabel.text = viewModel.itemName
        priceLabel.text = viewModel.itemPrice
        
        imageView.image = UIImage(named: viewModel.imageName)
        favoriteButton.setImage(UIImage(named: viewModel.heartImageName), for: .normal)

        addToBagButton.layer.cornerRadius = 15
        addToBagButton.setImage(UIImage(named: imageName), for: .normal)
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.heightAnchor.constraint(lessThanOrEqualToConstant: 180),
        ])
        
        NSLayoutConstraint.activate([
            favoriteButton.widthAnchor.constraint(equalToConstant: 20),
            favoriteButton.heightAnchor.constraint(equalToConstant: 20),
            favoriteButton.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 8),
            favoriteButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -10)
        ])

        let buttonWidth = addToBagButton.widthAnchor.constraint(equalToConstant: 33)
        let buttonHeight = addToBagButton.heightAnchor.constraint(equalToConstant: 33)

        NSLayoutConstraint.activate([
            addToBagButton.centerYAnchor.constraint(equalTo: containingView.centerYAnchor),
            buttonHeight,
            buttonWidth,
            addToBagButton.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])

        NSLayoutConstraint.activate([
            containingView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            containingView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containingView.trailingAnchor.constraint(equalTo: addToBagButton.leadingAnchor),
            containingView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])

        NSLayoutConstraint.activate([
            itemLabel.topAnchor.constraint(equalTo: containingView.topAnchor, constant: 4),
            itemLabel.leadingAnchor.constraint(equalTo: containingView.leadingAnchor),
            itemLabel.trailingAnchor.constraint(equalTo: addToBagButton.leadingAnchor),
         //   itemLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 35.0)
        ])

        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: itemLabel.bottomAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: containingView.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: containingView.trailingAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: containingView.bottomAnchor),
            priceLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 35.0)
        ])

      //  self.setContentHuggingPriority(.required + 1, for: .vertical)
      //  containingView.setContentHuggingPriority(.required + 2, for: .vertical)
       // containingView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
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


    private func configureActions() {
        favoriteButton.addTarget(self, action: #selector(toggleFavorite), for: .touchUpInside)
        addToBagButton.addTarget(self, action: #selector(toggleItemInBag), for: .touchUpInside)
    }

    @objc func toggleFavorite(sender: UIButton) {
        guard let viewModel = self.viewModel else { return }
        print("GETTING CALLLLLEEEDDDDDD")
        viewModel.isFavorite = !viewModel.isFavorite
        updateFavoriteButton(isFavorite: viewModel.isFavorite)
    }

    @objc func toggleItemInBag() {
        guard let viewModel = self.viewModel else { return }
        viewModel.isInBag = !viewModel.isInBag
        updateBagButton(inBag: viewModel.isInBag)
    }

    private func updateBagButton(inBag: Bool) {
        let imageName = inBag ? "bag_shop_bold" : "bag_shop"
        addToBagButton.setImage(UIImage(named: imageName), for: .normal)
    }

    private func updateFavoriteButton(isFavorite: Bool) {
        let imageName = isFavorite ? "HeartFilled" : "Heart"
        favoriteButton.setImage(UIImage(named: imageName), for: .normal)
    }
}
