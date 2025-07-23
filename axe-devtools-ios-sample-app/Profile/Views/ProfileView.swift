//
//  ProfileView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/25/22.
//

import UIKit

class ProfileView: UIView {
    var sendEvent: ((_ event: Event) -> Void)?

    lazy var customerInfoView: CustomerInfoView = {
        let civ = CustomerInfoView()
        civ.translatesAutoresizingMaskIntoConstraints = false
        return civ
    }()

    lazy var promoImageView: PromoView = {
        let piv = PromoView()
        piv.translatesAutoresizingMaskIntoConstraints = false
        return piv
    }()

    lazy var profileTableView: ProfileTableView = {
        let ptv = ProfileTableView()
        ptv.translatesAutoresizingMaskIntoConstraints = false
        ptv.didSelectCell = handleSelectedCell
        return ptv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buildView() {
        self.addSubview(customerInfoView)
        self.addSubview(promoImageView)
        self.addSubview(profileTableView)
        updateConstraints()

        self.backgroundColor = UIColor(named: "LightGray")
    }

    override func updateConstraints() {
        super.updateConstraints()

        NSLayoutConstraint.activate([
            customerInfoView.topAnchor.constraint(equalTo: self.topAnchor, constant: 75),
            customerInfoView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            customerInfoView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])

        NSLayoutConstraint.activate([
            promoImageView.topAnchor.constraint(equalTo: customerInfoView.customerImageView.bottomAnchor, constant: 30),
            promoImageView.heightAnchor.constraint(equalToConstant: 157),
            promoImageView.widthAnchor.constraint(equalToConstant: 327),
            promoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            promoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])

        NSLayoutConstraint.activate([
            profileTableView.topAnchor.constraint(equalTo: promoImageView.bottomAnchor, constant: 28),
            profileTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            profileTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            profileTableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])

    }

    private func handleSelectedCell(_ viewModel: TableRowModel) {
        switch viewModel.text {
        case "Need help?":
            self.sendEvent?(.shouldNavigate(to: .contactUs))
        default:
            break
        }
    }
}

enum Route {
    case contactUs
}

extension ProfileView {
    enum Event {
        case shouldNavigate(to: Route)
    }
}
