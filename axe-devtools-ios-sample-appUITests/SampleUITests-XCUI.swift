//
//  axe_devtools_ios_sample_appUITests.swift
//  axe-devtools-ios-sample-appUITests
//
//  Created by Kate Owens on 3/14/22.
//

import axe_devtools_ios_sample_app
import axeDevToolsXCUI
import XCTest

class SampleUITestsXCUIFramework: XCTestCase {
    var axe: AxeDevTools?
    var app = XCUIApplication()

    override func setUp() {
        axe = try? AxeDevTools.login(withAPIKey: Login.APIKey)

        app.launch()
        sleep(1)
    }

    // Runs an accessibility scan on each tab in the sample application, then posts to the dashboard. Contains a few different options for implementing -- feel free to play around with it!
    func testAccessibilityAndPostResults() throws {
        guard let result = try axe?.run(onElement: app) else { return XCTFail() } // Run a scan on the first page
        try axe?.postResult(result) // Post scan results to the mobile dashboard

        let tabBar = XCUIApplication().tabBars["Tab Bar"]
        tabBar.children(matching: .button).element(boundBy: 1).tap() // navigate to a tab by it's index

        guard let result = try axe?.run(onElement: app) else { return XCTFail() } // Run a scan on the selected tab
        try axe?.postResult(result, withScanName: "Catalog") // Post the scan results to dashboard and add a new scan name

        tabBar.buttons["Cart"].tap() // Navigate to a tab by its title
        guard let result = try axe?.run(onElement: app) else { return XCTFail() } // Run a scan on the selected tab
        try axe?.postResult(result, withTags: ["Cart Tab", "iPhone 15 Pro"]) // Post the scan results to dashboard and add tags to your scan to easily share with your coworkers when it's pushed to the dashboard

        tabBar.buttons["Profile"].tap()
        guard let result = try axe?.run(onElement: app) else { return XCTFail() } // Run a scan on the selected tab
        XCTAssertEqual(result.failures.count, 0) // Fail the test if any accessibilitity issues are found in the scan
    }

    func testAccessibilityAndSaveResultsLocally() throws {
        var lastResult: AxeResult?

        guard let result = try axe?.run(onElement: app) else { return XCTFail() } // Run a scan on the first page
        try axe?.saveResult(result) // Save the results of the accessibility scan, by default results will be saved to a folder called 'AxeDevToolsResults' within your local User folder

        lastResult = result
        let critical = lastResult?.failures.filter { $0.impact == .CRITICAL }.count // filter the failures in scan results for accessibility issues with an impact level of critical
        XCTAssertTrue(critical == 0, "Critical Accessibility Results were found." ) // Assert that there are no critical impact accessibility issues in scan results
    }
}
