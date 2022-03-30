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
        nameLabel.text = viewModel?.category
    }

    override func updateConstraints() {
        super.updateConstraints()
    }
    
}
