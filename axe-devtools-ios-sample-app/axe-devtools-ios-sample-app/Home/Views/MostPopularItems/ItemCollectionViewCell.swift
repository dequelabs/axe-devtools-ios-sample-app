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
    
    lazy var textVerticalStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 4
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
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
        self.contentView.isUserInteractionEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.layer.cornerRadius = 20
    }
    
    private func buildCell() {
        self.addSubview(imageView)
        imageView.addSubview(favoriteButton)
        
        self.addSubview(textVerticalStackView)
        textVerticalStackView.addArrangedSubview(itemLabel)
        textVerticalStackView.addArrangedSubview(priceLabel)
        
        self.addSubview(addToBagButton)

        configureElements()
        updateConstraints()
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
            imageView.widthAnchor.constraint(lessThanOrEqualToConstant: 152)
        ])
        
        NSLayoutConstraint.activate([
            favoriteButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 20),
            favoriteButton.heightAnchor.constraint(greaterThanOrEqualToConstant: 20),
            favoriteButton.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 10),
            favoriteButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -10)
        ])

        let buttonWidth = addToBagButton.widthAnchor.constraint(equalToConstant: 33)
        let buttonHeight = addToBagButton.heightAnchor.constraint(equalToConstant: 33)

        NSLayoutConstraint.activate([
            addToBagButton.centerYAnchor.constraint(equalTo: textVerticalStackView.centerYAnchor),
            buttonHeight,
            buttonWidth,
            addToBagButton.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            textVerticalStackView.topAnchor.constraint(greaterThanOrEqualTo: self.imageView.bottomAnchor, constant: 16),
            textVerticalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            textVerticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textVerticalStackView.trailingAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }

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
