//
//  ProfileModel.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/24/22.
//

import Foundation

class ProfileModel {

    var iconName: String {
        return "Menu"
    }
    var customerText: String {
        return "Customer"
    }

    var customerName: String {
        return "James Anderson"
    }

    var customerImageName: String {
        "profileImage"
    }

    var editIconName: String {
        return "Edit Square"
    }

    var promoImageName: String {
        return "PromoCodeImage"
    }

    var promoPercentageText: String {
        return "45% SALE"
    }

    var promoImageText: String {
        return "Promo for you"
    }

    var promoCode: String {
        return "XT4FH33D"
    }

    var tableVM = TableViewModel()
    var profileCellModels: [TableRowModel] = TableRowDataSource().allRows

}
