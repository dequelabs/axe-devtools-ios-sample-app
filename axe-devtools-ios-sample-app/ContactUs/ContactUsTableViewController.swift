//
//  ContactUsTableViewController.swift
//  axe-devtools-ios-sample-app
//

import UIKit

final class ContactUsTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        self.view.backgroundColor = UIColor(named: "LightGray")
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.title = "Contact Us"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        ContactUsTableViewCell(style: .default, reuseIdentifier: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
}
