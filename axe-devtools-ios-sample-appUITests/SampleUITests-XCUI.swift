//
//  axe_devtools_ios_sample_appUITests.swift
//  axe-devtools-ios-sample-appUITests
//
//  Created by Kate Owens on 3/14/22.
//

import axe_devtools_ios_sample_app
import axeDevToolsXCUI
import XCTest

// For more information on automated testing, please visit: https://docs.deque.com/devtools-mobile/2023.8.16/en/xcui
class SampleUITestsXCUIFramework: XCTestCase {
    var axe: AxeDevTools?
    var app = XCUIApplication()

    override func setUp() {
        axe = try? AxeDevTools.login(withAPIKey: Login.APIKey)
        app.launch()
        sleep(1)
    }

    // This test runs an accessibility scan on each tab in the sample application, then posts to the dashboard. Contains a few different options for implementing -- feel free to play around with it!
    func testAccessibilityAndPostResults() throws {
        guard let result = try axe?.run(onElement: app) else { return XCTFail() } 
        // Run a scan on the first page of the sample app
        // For more information about running an accessibility scan visit: https://docs.deque.com/devtools-mobile/2023.8.16/en/xcui#capture-a-scan

        try axe?.postResult(result)
        // Post scan results to the mobile dashboard
        // For more information on this feature please visit:  https://docs.deque.com/devtools-mobile/2023.8.16/en/xcui#send-results-to-the-dashboard

        let tabBar = XCUIApplication().tabBars["Tab Bar"]

        tabBar.buttons["Catalog"].tap()
        guard let result = try axe?.run(onElement: app) else { return XCTFail() } 
        try axe?.postResult(result, withScanName: "Catalog")
        // Rename a scan and post it to the dashboard. For more information on renaming a scan, check out  https://docs.deque.com/devtools-mobile/2023.8.16/en/ios-scan-name

        tabBar.buttons["Cart"].tap() // Navigate to a tab by its title
        guard let result = try axe?.run(onElement: app) else { return XCTFail() }
        try axe?.postResult(result, withTags: ["Cart Tab", "iPhone 15 Pro"]) // Add tags to your scan to easily share with your coworkers when it's pushed to the dashboard.
        // For more infromation on tagging a scan please see: https://docs.deque.com/devtools-mobile/2023.8.16/en/ios-tag-result

        tabBar.buttons["Profile"].tap()
        guard let result = try axe?.run(onElement: app) else { return XCTFail() }
        XCTAssertEqual(result.failures.count, 0) // Fail the test if any accessibilitity issues are found in the scan
    }

    // This test runs an accessibility scan on the first page of the sample application and saves the scan results locally.
    func testAccessibilityAndSaveResultsLocally() throws {
        var lastResult: AxeResult?

        guard let result = try axe?.run(onElement: app) else { return XCTFail() }
        let savedScan = try axe?.saveResult(result, withScanName: "Sample App Accessibility scan") // Save the results of the accessibility scan; by default, they will be saved to a folder called 'AxeDevToolsResults' within your local User folder
        // for more information on saving results locally see: https://docs.deque.com/devtools-mobile/2023.8.16/en/ios-save-result
        lastResult = result
        let critical = lastResult?.failures.filter { $0.impact == .CRITICAL }.count
        XCTAssertTrue(critical == 0, "Critical Accessibility Results were found." ) // Assert that there are no critical impact accessibility issues in scan results
    }
}
