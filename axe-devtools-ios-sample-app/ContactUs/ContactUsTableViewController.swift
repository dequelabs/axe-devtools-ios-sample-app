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
        navigationController?.setNavigationBarHidden(false, animated: true)
        tableView.separatorStyle = .none
        view.backgroundColor = UIColor(named: "LightGray")
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
    ) -> CGFloat { 300 }
}
