//
//  ProfileViewModel.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 3/24/22.
//

import Foundation

class ProfileViewModel {

    let profileModel = ProfileModel()

    var iconName: String {
        return profileModel.iconName
    }

    var customerText: String {
        profileModel.customerText
    }
    
    var customerName: String {
        profileModel.customerName
    }

    var customerPhotoName: String {
        profileModel.customerImageName
    }

    var editIconName: String {
        return profileModel.editIconName
    }

    var promoImageName: String {
        return profileModel.promoImageName
    }

    var promoPercentageText: String {
        return profileModel.promoPercentageText
    }

    var promoImageText: String {
        return profileModel.promoImageText
    }

    var promoCode: String {
        return profileModel.promoCode
    }

    var rowCount: Int {
        return profileModel.profileCellModels.count
    }

    var cellModels: [TableRowModel] {
        return profileModel.profileCellModels
    }

    var arrowIconName: String {
        return profileModel.arrowIconName
    }
}


