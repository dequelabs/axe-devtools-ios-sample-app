//
//  AxeLoginInfo.swift
//  axe-devtools-ios-sample-app
//
//  Created by Kate Owens on 4/14/22.
//

import Foundation

struct Credentials {
    let username = "Kate.owens@deque.com"
    let password = "Kate.owens!"
    let authURL = "https://auth-qa.dequelabs.com/auth/"
    let serverURL = "https://mobile-qa2.dequelabs.com"
}

struct AxeLoginInfo {
    let credentials = Credentials()
}
