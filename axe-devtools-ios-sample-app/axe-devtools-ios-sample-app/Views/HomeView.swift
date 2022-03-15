//
//  HomeView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/14/22.
//

import UIKit

class HomeView: UIView {
    var homeVM = HomeViewModel()
    var headerView: HeaderView {
        let hv = HeaderView()
        hv.translatesAutoresizingMaskIntoConstraints = false
        return hv
    }

   // var mostPopularItemsView = MostPopularItemsView()
    // collections view
    // recommended items view

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildView() {
        self.addSubview(headerView)
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headerView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
