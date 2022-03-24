//
//  CatalogView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/22/22.
//

import UIKit

class CatalogView: UIView {

    let viewModel = CatalogViewModel()

    lazy var titleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = viewModel.title
        l.font = .systemFont(ofSize: 32)
        return l
    }()

    lazy var searchImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "Search")
        iv.image = image
        return iv
    }()

    lazy var allCategories: AllCategoriesView = {
        let acv = AllCategoriesView()
        acv.translatesAutoresizingMaskIntoConstraints = false
        return acv
    }()

    lazy var newCollectionImageView: CatalogHeaderImageView = {
        let v = CatalogHeaderImageView(image: UIImage(named: viewModel.mainImageName))
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    lazy var allItemTypesView: AllItemTypesView = {
        let atv = AllItemTypesView()
        atv.translatesAutoresizingMaskIntoConstraints = false
        return atv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buildView() {
        self.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(titleLabel)
        self.addSubview(searchImageView)
        self.addSubview(allCategories)
        self.addSubview(newCollectionImageView)
        self.addSubview(allItemTypesView)

        updateConstraints()
    }

    override func updateConstraints() {
        super.updateConstraints()

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 60),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 38)
        ])

        NSLayoutConstraint.activate([
            searchImageView.heightAnchor.constraint(equalToConstant: 18),
            searchImageView.widthAnchor.constraint(equalToConstant: 18),
            searchImageView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            searchImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -28)
        ])

        NSLayoutConstraint.activate([
            allCategories.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            allCategories.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            allCategories.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            allCategories.heightAnchor.constraint(equalToConstant: 32),
            allCategories.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])

        NSLayoutConstraint.activate([
            newCollectionImageView.topAnchor.constraint(equalTo: allCategories.bottomAnchor, constant: 40),
            newCollectionImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            newCollectionImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            newCollectionImageView.heightAnchor.constraint(equalToConstant: 327),
            newCollectionImageView.widthAnchor.constraint(equalToConstant: 327)
        ])

        NSLayoutConstraint.activate([
            allItemTypesView.topAnchor.constraint(equalTo: newCollectionImageView.bottomAnchor, constant: 34),
            allItemTypesView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            allItemTypesView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            allItemTypesView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
