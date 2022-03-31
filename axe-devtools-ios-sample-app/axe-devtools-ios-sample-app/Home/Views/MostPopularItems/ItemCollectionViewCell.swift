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
    
    lazy var heartImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.isUserInteractionEnabled = true
        return iv
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
        imageView.addSubview(heartImageView)
        
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
        heartImageView.image = UIImage(named: viewModel.heartImageName)
        
        addToBagButton.backgroundColor = viewModel.isInBag ? .black : .clear
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
            heartImageView.widthAnchor.constraint(equalToConstant: 17),
            heartImageView.heightAnchor.constraint(equalToConstant: 16),
            heartImageView.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 10),
            heartImageView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -10)
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
            textVerticalStackView.topAnchor.constraint(equalTo: self.imageView.bottomAnchor),
            textVerticalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            textVerticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textVerticalStackView.trailingAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }

    private func configureActions() {
        heartImageView.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(toggleFavorite)))
        addToBagButton.addTarget(self, action: #selector(toggleItemInBag), for: .touchUpInside)
    }

    @objc private func toggleFavorite() {
        guard let viewModel = self.viewModel else { return }
        viewModel.isFavorite = !viewModel.isFavorite
        updateFavoriteButton(isFavorite: viewModel.isFavorite)
    }

    @objc private func toggleItemInBag() {
        guard let viewModel = self.viewModel else { return }
        viewModel.isInBag = !viewModel.isInBag
        updateBagButton(inBag: viewModel.isInBag)
    }

    private func updateBagButton(inBag: Bool) {
        let imageName = inBag ? "bag_shop_bold" : "bag_shop"
      //  addToBagButton.setImage(UIImage(named: imageName), for: .normal)
        print("GETTING CALLED")
        addToBagButton.backgroundColor = inBag ? .black : .clear
    }

    private func updateFavoriteButton(isFavorite: Bool) {
        heartImageView.image = isFavorite ? UIImage(named: "HeartFilled") : UIImage(named: "Heart")

    }
}
