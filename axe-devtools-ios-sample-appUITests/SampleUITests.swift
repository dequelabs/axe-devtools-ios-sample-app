//
//  SampleUITests.swift
//  axe-devtools-ios-sample-appUITests
//
//  Created by Kate Owens on 3/14/22.
//

import axe_devtools_ios_sample_app
import axeDevToolsXCUI
import XCTest

/*
 Full Getting Started guide is available here: https://docs.deque.com/devtools-mobile-analyzer/2023.8.16/en/ios-setup

 Quick Start Guide

 To get started:
 Set up axeDevTools automation for UITests in the 2 easy steps outlined below.
 Don't forget to save this file when finished. File > Save or Command + S

 To run an accessibility test:
 Select a simulator or device in Xcode and press cmd+U to begin running tests.
 Review your test results from the Mobile Dashboard: https://axe-mobile.deque.com/
 */

class SampleUITests: XCTestCase {
    var axe: AxeDevTools?
    var app = XCUIApplication()

    override func setUp() {
        // 1.
        // Enter your axe DevTools Mobile API key and axe Developer Hub project ID in the "" marks in the APIKey and projectId constants defined in the Login file
        // Get your API key here: https://axe.deque.com/settings
        // Get your axe Developer Hub Project Id here: https://axe.deque.com/axe-watcher/projects
        axe = try? AxeDevTools.startSession(apiKey: Login.APIKey, projectId: Login.projectId)

        // 1a (Optional). Experimental rules are rulesets that are still in testing and development. Results for the
        // experimental rules can be IGNORED with the ignoreExperimental method, and this way they will not run.
        axe?.configuration.ignoreExperimental()

        // 2.
        // Launch the sample app
        app.launch()
        sleep(1)
    }

    /*
     This test runs an accessibility scan on each tab in the sample application, then posts to the dashboard.
     This example contains a few different options for implementing -- feel free to play around with it!
     */
    func testAccessibilityAndPostResults() throws {

        // Run a scan on the first page of the sample app
        // For more information about running an accessibility scan visit:
        // https://docs.deque.com/devtools-mobile/2023.8.16/en/xcui#capture-a-scan
        guard let result = try axe?.run(onElement: app) else {
            XCTFail("\n\n🦮 axe DevTools didn't run - Did you add your API key in Login.swift?\n\n")
            return
        }

        // Post scan results to the mobile dashboard
        // For more information on this feature please visit:
        // https://docs.deque.com/devtools-mobile/2023.8.16/en/xcui#send-results-to-the-dashboard
        try axe?.postResult(result)

        let tabBar = XCUIApplication().tabBars["Tab Bar"]

        tabBar.buttons["Catalog"].tap()

        guard let result = try axe?.run(onElement: app) else {
            XCTFail("\n\n🦮 axe DevTools didn't run - Did you add your API key in Login.swift?\n\n")
            return
        }

        // Add a custom scan name when posting result. By default, the screen title is the scan name.
        // For more information on renaming a scan, check out:
        // https://docs.deque.com/devtools-mobile/2023.8.16/en/ios-scan-name
        let newScanName = "Catalog Tab"

        try axe?.postResult(result, withScanName: newScanName)

        tabBar.buttons["Cart"].tap()
        guard let result = try axe?.run(onElement: app) else {
            XCTFail("\n\n🦮 axe DevTools didn't run - Did you add your API key in Login.swift?\n\n")
            return
        }

        // Add tags to your scan to easily share with your coworkers when it's pushed to the dashboard.
        // For more infromation on tagging a scan please see:
        // https://docs.deque.com/devtools-mobile/2023.8.16/en/ios-tag-result
        let tags = ["Cart Tab, iPhone 15 Pro"]

        try axe?.postResult(result, withTags: tags)

        tabBar.buttons["Profile"].tap()
        guard let result = try axe?.run(onElement: app) else {
            XCTFail("\n\n🦮 axe DevTools didn't run - Did you add your API key in Login.swift?\n\n")
            return
        }
        try axe?.postResult(result, withScanName: "Profile Tab")
    }

    // This test runs an accessibility scan on the first page of the sample application and saves the scan results locally. By default, the results will be saved to a folder called 'AxeDevToolsResults' within your local User folder
    // For more information on saving results locally, please visit:
    // https://docs.deque.com/devtools-mobile/2023.8.16/en/ios-save-result
    func testAccessibilityAndSaveResultsLocally() throws {
        var lastResult: AxeResult?
        guard let result = try axe?.run(onElement: app) else {
            XCTFail("\n\n🦮 axe DevTools didn't run - Did you add your API key in Login.swift?\n\n")
            return
        }

        // Save scan results locally
        _ = try axe?.saveResult(result)

        lastResult = result
        let critical = lastResult?.failures.filter { $0.impact == .CRITICAL }.count

        // Assert that there are no critical impact accessibility issues in scan results
        XCTAssertTrue(critical == 0, "Critical Accessibility Results were found." )
    }
}
