//
//  ContactUsTableViewController.swift
//  axe-devtools-ios-sample-app
//

import UIKit

final class ContactUsTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    private func configureView() {
        // Navigation Bar
        let headerAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.italiana()
        ]

        let titleLabel = UILabel()
        titleLabel.text = "Contact Us"
        titleLabel.font = UIFont.italiana()

        navigationItem.titleView = titleLabel

        navigationController?.navigationBar.largeTitleTextAttributes = headerAttributes
        navigationController?.setNavigationBarHidden(false, animated: true)

        // Table View
        tableView.separatorStyle = .none

        // Background
        view.backgroundColor = UIColor(named: "LightGray")

        // Tab bar
        tabBarController?.tabBar.backgroundColor = .white
    }

    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell { ContactUsTableViewCell() }

    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int { 1 }

    override func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat { 200 }
}
