//
//  MostPopularItemsHeaderCollectionReusableView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/28/22.
//

import UIKit

class MostPopularItemsHeaderView: UICollectionReusableView {

    lazy var headerLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Most popular"
        let italiana = UIFont(name: "Italiana-Regular", size: 32)
        l.font = italiana
        l.textColor = .black
        return l
    }()

    lazy var itemsButton: UIButton = {
        let b = UIButton(type: .custom)
        let gilroyBold = UIFont(name: "Gilroy-ExtraBold", size: 14)
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(named: "ArrowGray")
        configuration.imagePlacement = .trailing
        configuration.attributedTitle = AttributedString("56 Items ", attributes: AttributeContainer([NSAttributedString.Key.font : UIFont(name: "Gilroy-ExtraBold", size: 14)!]))
        b.configuration = configuration
        b.tintColor = .lightGray
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buildView() {
        addSubview(headerLabel)
        addSubview(itemsButton)
        updateConstraints()
    }

    override func updateConstraints() {
        super.updateConstraints()

        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: self.topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])

        NSLayoutConstraint.activate([
            itemsButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            itemsButton.centerYAnchor.constraint(equalTo: headerLabel.centerYAnchor),
            itemsButton.heightAnchor.constraint(equalToConstant: 17)
        ])
    }
}
