//
//  CategoryCollectionCell.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/30/22.
//

import UIKit

class CategoryCollectionCell: UICollectionViewCell {

    var viewModel: CategoryCellViewModel? {
        didSet {
            buildCell()
        }
    }

    lazy var nameLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .black
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
        l.font = UIFont(name: "Gilroy-Light", size: 14)
        l.backgroundColor = .clear
        return l
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
    }

    private func buildCell() {
        self.addSubview(nameLabel)

        configureElements()
        updateConstraints()
    }

    private func configureElements() {
        nameLabel.text = viewModel?.category.name

        if viewModel?.category.name == "All"  {
            backgroundColor = .black
            nameLabel.textColor = .white
        }
    }

    override func updateConstraints() {
        super.updateConstraints()

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])

        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
    }
}
