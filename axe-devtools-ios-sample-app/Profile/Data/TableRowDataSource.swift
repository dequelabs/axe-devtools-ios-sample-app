//
//  TableRowDataSource.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/25/22.
//

import Foundation

class TableRowDataSource {
    let myDetails = TableRowModel(text: "My details", imageName: "Profile")
    let myOrders = TableRowModel(text: "My orders", imageName: "Paper")
    let paymentMethods = TableRowModel(text: "Payment methods", imageName: "WalletCellIcon")
    let addressBook = TableRowModel(text: "Address book", imageName: "Location")
    let needHelp = TableRowModel(text: "Need help?", imageName: "Info Square")
    let logOut = TableRowModel(text: "Log out", imageName: "Logout")

    lazy var allRows: [TableRowModel] = {
        return [myDetails,
                myOrders,
                paymentMethods,
                addressBook,
                needHelp,
                logOut]
    }()
}
