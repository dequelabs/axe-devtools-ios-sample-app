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
        return iv
    }()
    
    lazy var addToBagButton: UIButton = {
        let b = UIButton()
        b.layer.borderColor = UIColor.black.cgColor
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
    }
    
    private func configureElements() {
        guard let viewModel = viewModel else { return }
        let imageName = viewModel.isInBag ? "bag_shop_bold" : "bag_shop"
        
        itemLabel.text = viewModel.itemName
        priceLabel.text = viewModel.itemPrice
        
        imageView.image = UIImage(named: viewModel.imageName)
        heartImageView.image = UIImage(named: viewModel.heartImageName)
        
        addToBagButton.backgroundColor = viewModel.isInBag ? .black : .white
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
}
