//
//  SearchBarView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/15/22.
//

import Foundation
import UIKit

class SearchBarView: UIView {
// figure out how to get search field border to be white
    lazy var titleLabel: UILabel = {
        let l = UILabel()
        l.text = "Chic Boutique"
        l.textColor = .white
        l.backgroundColor = .black
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.preferredFont(forTextStyle: .title1)
        return l
    }()

    lazy var searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.text = "Search..."
        sb.barStyle = UIBarStyle.black
        sb.searchTextField.borderStyle = .roundedRect
        sb.isUserInteractionEnabled = false
        sb.translatesAutoresizingMaskIntoConstraints = false
        return sb
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        backgroundColor = .black
        self.layer.cornerRadius = 15
        self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    private func buildView() {
        self.addSubview(searchBar)
        self.addSubview(titleLabel)
        updateConstraints()
    }

    override func updateConstraints() {
        super.updateConstraints()
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.searchBar.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 16),
            self.searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            self.searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            self.searchBar.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
    }
}
