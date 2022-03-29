//
//  SearchBarView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/15/22.
//

import Foundation
import UIKit

class SearchBarView: UIView {

    lazy var titleImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "chic boutique")
        iv.contentMode = .scaleAspectFit
        iv.image = image
        return iv
    }()

    lazy var searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.backgroundColor = .black
        sb.isUserInteractionEnabled = false
        sb.translatesAutoresizingMaskIntoConstraints = false
        return sb
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        self.layer.cornerRadius = 15
        self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }

    private func buildView() {
        self.addSubview(titleImageView)
        self.addSubview(searchBar)
        updateConstraints()
        // try ignore safe area insets
    }

    override func updateConstraints() {
        super.updateConstraints()
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: 161),
            self.titleImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 60),
            self.titleImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.titleImageView.heightAnchor.constraint(equalToConstant: 24)
            ])

        NSLayoutConstraint.activate([
            self.searchBar.topAnchor.constraint(equalTo: self.titleImageView.bottomAnchor, constant: 16),
            self.searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            self.searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            self.searchBar.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
    }
}
