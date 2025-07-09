//
//  RegressionUITests.swift
//  RegressionUITests
//

import axe_devtools_ios_sample_app
import axeDevToolsXCUI
import XCTest

class RegressionUITests: XCTestCase {
    var axe: AxeDevTools?
    var app = XCUIApplication()

    var lastResult: AxeResult?

    override func setUp() {
        axe = try? AxeDevTools.login(withAPIKey: ProcessInfo.processInfo.environment["ADT_API_KEY"] ?? "")
        app.launch()
        sleep(2) // allow app to fully load, Github actions needed a moment.
    }

    // Iterates through each tab of the sample application and runs an accessibility scan on the screen, then posts it to the dashboard. Contains a few different options for implementing -- feel free to play around with it!
    func testHappyPathAccessibility() throws {
        // Run a scan on the first page and post the result to the dashboard.
        try scanForAccessibility(withScanName: "Home")

        //navigate to a tab by it's index, and run a scan, post to the dashboard
        let tabBar = XCUIApplication().tabBars["Tab Bar"]
        tabBar.children(matching: .button).element(boundBy: 1).tap()
        try scanForAccessibility(withScanName: "Catalog")

        // FOR DEMO: Fail the test if critical accessibility errors are found on the first page.
        assertNoCriticalResults()

        //navigate to a tab by its title
        tabBar.buttons["Cart"].tap()
        try scanForAccessibility(withScanName: "Cart")

        tabBar.children(matching: .button).element(boundBy: 3).tap()
        try scanForAccessibility(withScanName: "Profile")
    }

    // A helper method for keeping things cleaner when pushing to the dashboard, or saving a result locally.
    func scanForAccessibility(withScanName name: String = "unnamed scan") throws {
        guard let result = try axe?.run(onElement: app) else {
            XCTFail("\n\n🦮 axe DevTools didn't run - Did you add your API key in Login.swift?\n\n")
            return
        }
        lastResult = result
        // Post the report to the dashboard

        // try axe?.postResult(result, withScanName: name)
        _ = try axe?.saveResult(result, toPath: "RegressionScans", withFileName: name, withScanName: name)
    }

    func assertNoCriticalResults() {
        guard let result = lastResult else {
            XCTFail("\n\n🦮 axe DevTools didn't run - Did you add your API key in Login.swift?\n\n")
            return
        }
        let critical = result.failures.filter { $0.impact == .CRITICAL }.count
        XCTAssertTrue( critical == 0, "Critical Accessibility Results were found." )
    }
}
