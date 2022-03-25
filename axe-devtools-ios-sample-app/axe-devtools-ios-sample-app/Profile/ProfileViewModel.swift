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

    var myOrdersIconName: String {
        return profileModel.myOrdersIconName
    }

    var myDetailsText: String {
        return profileModel.myDetailsText
    }

    var myOrdersText: String {
        return profileModel.myOrdersText
    }

    var paymentMethodsIconName: String {
        return profileModel.paymentMethodsIconName
    }

    var paymentMethodsText: String {
        return profileModel.paymentMethodsText
    }

    var addressBookIconName: String {
        return profileModel.addressBookIconName
    }

    var addressBookText: String {
        return profileModel.addressBookText
    }

    var needHelpIconName: String {
        return profileModel.needHelpIconName
    }

    var needHelpText: String {
        return profileModel.needHelpText
    }

    var logOutIconName: String {
        return profileModel.logOutIconName
    }

    var logOutText: String {
        return profileModel.logOutText
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
}
