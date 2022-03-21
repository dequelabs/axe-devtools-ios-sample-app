//
//  BaseScrollView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/21/22.
//

import UIKit

class BaseScrollView: UIView {
    lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    lazy var containingView: UIView = {
        let cv = UIView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buildView() {
        self.addSubview(scrollView)
        scrollView.addSubview(containingView)
        updateConstraints()
    }

    override func updateConstraints() {
        super.updateConstraints()

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            scrollView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            scrollView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])

        NSLayoutConstraint.activate([
            containingView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            containingView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            containingView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            containingView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            containingView.heightAnchor.constraint(equalTo: self.scrollView.frameLayoutGuide.heightAnchor),
            containingView.widthAnchor.constraint(equalTo: self.scrollView.frameLayoutGuide.widthAnchor)
        ])
    }
}
