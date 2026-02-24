//
//  EmailToggleView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Nitya Baddam on 2/5/26.
//

import UIKit

class EmailToggleView: UIView {

    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isAccessibilityElement = false
        label.text = "May we contact you via email?"
        label.font = UIFont.gilroy()
        label.textAlignment = .left
        return label
    }()

    let toggle = AccessibleSwitch()

    init() {
        super.init(frame: .zero)

        toggle.accessibilityLabel = label.text

        self.addSubview(label)
        self.addSubview(toggle)
        
        self.addConstraints([
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            toggle.leadingAnchor.constraint(equalTo: label.trailingAnchor,
                                            constant: 8.0),
            toggle.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                             constant: -2.0),

            // Added these so that the toggle can be centered still if its parent
            //  has a required height
            toggle.topAnchor.constraint(greaterThanOrEqualTo: self.topAnchor),
            toggle.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor),
            toggle.centerYAnchor.constraint(equalTo: self.centerYAnchor),

            // Added these so that if large Dynamic Type sizes are used, the labels won't get cut off by its parent view
            label.topAnchor.constraint(greaterThanOrEqualTo: self.topAnchor),
            label.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
