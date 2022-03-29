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

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.dataSource = self
        self.delegate = self
        self.register(ProfileTableCell.self, forCellReuseIdentifier: cellId)
        self.isScrollEnabled = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rowCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ProfileTableCell

        let cellVM = TableRowViewModel(model: viewModel.cellModels[indexPath.item])
        let arrowImage = UIImage(named: viewModel.arrowIconName)
        cell.accessoryView = UIImageView(image: arrowImage)
        cell.viewModel = cellVM
        return cell
    }
}
