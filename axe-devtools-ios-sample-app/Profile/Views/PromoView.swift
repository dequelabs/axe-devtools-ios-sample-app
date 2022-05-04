//
//  PromoView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/24/22.
//

import UIKit

class PromoView: UIView {
    let viewModel = ProfileViewModel()

    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        return iv
    }()

    lazy var percentageSaleLabel: UILabel = {
        let l = UILabel()
        l.textColor = .white
        l.font = UIFont(name: "Gilroy-ExtraBold", size: 18)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    lazy var promoForYouLabel: UILabel = {
        let l = UILabel()
        l.textColor = .white
        l.font = UIFont(name: "Gilroy-Light", size: 14)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    lazy var promoCodeLabel: UILabel = {
        let l = UILabel()
        l.textColor = .white
        l.font = UIFont(name: "Gilroy-ExtraBold", size: 24)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
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
        self.addSubview(imageView)
        imageView.addSubview(percentageSaleLabel)
        imageView.addSubview(promoForYouLabel)
        imageView.addSubview(promoCodeLabel)

        imageView.image = UIImage(named: viewModel.promoImageName)
        percentageSaleLabel.text = viewModel.promoPercentageText
        promoForYouLabel.text = viewModel.promoImageText
        promoCodeLabel.text = viewModel.promoCode
        updateConstraints()
    }

    override func updateConstraints() {
        super.updateConstraints()

        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 157),
            imageView.widthAnchor.constraint(equalToConstant: 327),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24)
        ])

        NSLayoutConstraint.activate([
            percentageSaleLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 16),
            percentageSaleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            promoForYouLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 90),
            promoForYouLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 274),
            promoForYouLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 16),
        ])

        NSLayoutConstraint.activate([
            promoCodeLabel.topAnchor.constraint(equalTo: promoForYouLabel.bottomAnchor),
            promoCodeLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 16),
            promoCodeLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16)
        ])
    }
}
