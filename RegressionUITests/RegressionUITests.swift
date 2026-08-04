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
        axe = try? AxeDevTools.startScanSession(apiKey: Login.APIKey, projectId: Login.projectId)

        app.launch()
        sleep(2) // allow app to fully load
    }

    // Iterates through each tab of the sample application and runs an accessibility scan on the screen, then saves it (or posts it to DevHub). Contains a few different options for implementing -- feel free to play around with it!
    func testHappyPathAccessibility() throws {
        // Run a scan on the first page.
        try scanForAccessibility(withScanName: "Home")

        let tabBar = XCUIApplication().tabBars["Tab Bar"]
        
        // Navigate to a tab, run a scan.
        tabBar.buttons["Catalog"].tap()
        try scanForAccessibility(withScanName: "Catalog")

        // FOR DEMO: Fail the test if critical accessibility errors are found on the Catalog page.
        assertNoCriticalResults()

        tabBar.buttons["Cart"].tap()
        try scanForAccessibility(withScanName: "Cart")

        tabBar.buttons["Profile"].tap()
        try scanForAccessibility(withScanName: "Profile")
    }

    // A helper method for keeping things cleaner when saving a result locally, or posting to DevHub.
    func scanForAccessibility(withScanName name: String = "unnamed scan") throws {
        guard let result = try axe?.run(onElement: app) else {
            XCTFail("\n\n🦮 axe DevTools didn't run - Did you add your API key in Login.swift?\n\n")
            return
        }
        lastResult = result
        
        // Uncomment the line below to post the report to DevHub
        // try axe?.postResult(result, withScanName: name)
        
        _ = try axe?.saveResult(result, toPath: "RegressionScans", withFileName: name, withScanName: name)
    }

    func assertNoCriticalResults() {
        guard let result = lastResult else {
            XCTFail("\n\n🦮 axe DevTools didn't run - Did you add your API key in Login.swift?\n\n")
            return
        }
        // KNOWN ISSUE: this app uses fixed font sizes throughout, so every screen
        // fails SupportsDynamicType. We allow it here so the check still catches
        // anything new -- in your own app you'd fix the fonts instead of allowing it.
        let knownIssues = [AxeRuleId.SupportsDynamicType.toString()]

        let critical = result.failures.filter { $0.impact == .CRITICAL }
        let unexpected = critical.filter { !knownIssues.contains($0.ruleId) }

        print("🦮 \(critical.count) critical issue(s) found, \(critical.count - unexpected.count) known.")
        XCTAssertTrue(unexpected.isEmpty,
                      "Unexpected critical results: \(unexpected.map(\.ruleId).joined(separator: ", "))")
    }
}
