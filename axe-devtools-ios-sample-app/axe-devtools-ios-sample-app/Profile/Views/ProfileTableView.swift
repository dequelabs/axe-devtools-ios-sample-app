//
//  ProfileTableView.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/24/22.
//

import UIKit

class ProfileTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    let viewModel = ProfileViewModel()
    let cellId = "cellId"

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rowCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ProfileTableCell
        return cell
    }
    
}
