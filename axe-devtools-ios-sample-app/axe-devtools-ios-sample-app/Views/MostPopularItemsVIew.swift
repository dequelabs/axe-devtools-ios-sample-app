//
//  MostPopularItemsVIew.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/14/22.
//

import UIKit

class MostPopularItemsView: UIView {

    let viewModel = MostPopularItemsViewModel()

    lazy var sectionTitleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = viewModel.title
        return l
    }()

    lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buildView() {
        self.addSubview(sectionTitleLabel)
        self.addSubview(stackView)
        
        viewModel.items.forEach { item in
            self.addSubview(ItemTileView(viewModel: ItemViewModel(item: item)))
            //stackView.addArrangedSubview(ItemTileView(viewModel: ItemViewModel(item: item)))
        }

        updateConstraints()
    }

    override func updateConstraints() {
        super.updateConstraints()

        NSLayoutConstraint.activate([
            self.sectionTitleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            self.sectionTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
        ])

        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.topAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])

//        NSLayoutConstraint.activate([
//            self.stackView.topAnchor.constraint(equalTo: self.topAnchor),
//            self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
//        ])
    }
}
