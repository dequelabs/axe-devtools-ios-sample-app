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

    // Iterates through each tab of the sample application and runs an accessibility scan on the screen, then posts it to the dashboard. Contains a few different options for implementing -- feel free to play around with it!
    func testHappyPathAccessibility() throws {
        // Run a scan on the first page and post the result to the dashboard.
        // Subsequent scans will be done by the helper function `scanForAccessibility` to keep things tidier.
        guard let result = try axe?.run(onElement: app) else { XCTFail(); return }
        try axe?.postResult(result)

        //navigate to a tab by it's index, and run a scan, post to the dashboard
        let tabBar = XCUIApplication().tabBars["Tab Bar"]
        tabBar.children(matching: .button).element(boundBy: 1).tap()

        guard let result = try axe?.run(onElement: app) else { return XCTFail() }
        try axe?.postResult(result, withTags: ["Catalog"])

        //navigate to a tab by its title
        tabBar.buttons["Cart"].tap()
        try scanForAccessibility()

        tabBar.children(matching: .button).element(boundBy: 3).tap()
        try scanForAccessibility()
    }

    // one push to dashboard
    // one save locally
    // one that adds a scan name and tags to dashboard
    
    func testAccessibilityAndPostResults() throws {
        guard let result = try axe?.run(onElement: app) else { return XCTFail() }
        try axe?.postResult(result) // Post scan results to the Mobile Dashboard to be shared with the team
    }

    func testAccessibilityAndSaveResults() throws {
        guard let result = try axe?.run(onElement: app) else { return XCTFail() }
        try axe?.saveResult(result) // Save the results of the accessibility scan
    }

    // one that files if critical issue found
    func testAccessibilityNoCriticalFailures() throws {
        // maybe navigate to a different page here or something for the scan idk    
        var lastResult: AxeResult?

        guard let result = try axe?.run(onElement: app) else { return XCTFail() }

        lastResult = result
        let critical = lastResult?.failures.filter { $0.impact == .CRITICAL }.count
        XCTAssertTrue( critical == 0, "Critical Accessibility Results were found." )
    }

    // A helper method for keeping things cleaner when pushing to the dashboard, or saving a result locally.
    func scanForAccessibility() throws {
        guard let result = try axe?.run(onElement: app) else { return XCTFail() }
        try axe?.postResult(result)

        /*
         OPTIONAL:
         --------
         Fail the build if accessibility issues are found on the last scan result.
         Remove the '//' below to enable this line.
         */

        // XCTAssertEqual(result.failures.count, 0)

        /*
         OPTIONAL:
         --------
         Add tags to your scan to easily share with your coworkers when you push to the dashboard.
         Remove the '//' below to enable this line.

         NOTE: Remove `try axe?.postResult(result)` above, or you'll get two results pushed to the dashboard each time.
         */

        // try axe?.postResult(result, withTags: ["MyTag"])

        /* or use tags and scan name: */

        // try axe?.postResult(result, withTags: ["MyTag"], withScanName: "MyScansName")
    }

    
}
