//
//  HomeView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/14/22.
//

import UIKit

class HomeScreenImageView: UIView {
    var homeVM = HomeViewModel()

    lazy var mainImageView: HomeImageView = {
        let hv = HomeImageView()
        hv.translatesAutoresizingMaskIntoConstraints = false
        return hv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        buildView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildView() {
        self.addSubview(mainImageView)
        updateConstraints()
    }

        override func updateConstraints() {
        super.updateConstraints()
            NSLayoutConstraint.activate([
                self.heightAnchor.constraint(equalToConstant: 327),
                self.widthAnchor.constraint(equalToConstant: 327)
            ])
        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: self.topAnchor),
            mainImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
