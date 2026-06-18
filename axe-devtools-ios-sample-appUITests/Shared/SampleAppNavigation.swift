//
//  SampleAppNavigation.swift
//  axe-devtools-ios-sample-appUITests
//
//  Small helpers that keep the example tests terse by centralizing
//  the sample app's tab-bar navigation. The four tabs (Home, Catalog,
//  Cart, Profile) are defined in MainTabBarViewController.
//

import XCTest

extension XCUIApplication {
    /// The sample app's main tab bar.
    var sampleTabBar: XCUIElement {
        tabBars["Tab Bar"]
    }

    /// The titles of every tab in the sample app, in display order.
    static let sampleTabs = ["Home", "Catalog", "Cart", "Profile"]

    /// Taps the tab with the given title and waits briefly for it to settle.
    func goToTab(_ title: String) {
        sampleTabBar.buttons[title].tap()
    }
}
