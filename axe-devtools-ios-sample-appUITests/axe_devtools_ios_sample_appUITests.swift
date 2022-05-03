//
//  axe_devtools_ios_sample_appUITests.swift
//  axe-devtools-ios-sample-appUITests
//
//  Created by Kate Owens on 3/14/22.
//

import axe_devtools_ios_sample_app
import axeDevToolsUIKit
import XCTest

class axe_devtools_ios_sample_appUITests: XCTestCase {
    var axe: AxeDevTools?
    var app = XCUIApplication()

    override func setUp() {
        axe = try? AxeDevTools.login(withUsername: "<DEQUE_USERNAME>", andPassword: "<DEQUE_PASSWORD>")

        app.launch()
    }

    func testAccessibility() throws {
        let FAB_ID = "com.deque.axeDevTools.accessibilityFab"
        let fab = app.buttons[FAB_ID]

        // Tap the FAB to send the scan to the server
        fab.tap()

        // Once it returns, the result from the scan can be seen on the Dashboard.
        // The FAB's label has the key needed to retrieve the scan from the server.
        XCTAssert(fab.waitForExistence(timeout: 5))

        // Grab the result from the server
        guard let key = AxeDevToolsResultKey(fabTitle: fab.label) else {
            XCTFail("Could not retrieve scan from the server.")
            return
        }

        // Tag the result with the tags provided
        do {
            try axe?.tagResult(key, withTags: ["sauce testing"])
        } catch {
            XCTFail("Failed to tag result")
        }

        guard let result = try? axe?.getResult(key) else {
            XCTFail("result data couldn't be parsed.")
            return
        }

        //UNCOMMENT THIS LINE FOR TESTS TO FAIL BECAUSE WE HAVE ACCESSIBILITY FAILURES
        //XCTAssertEqual(result.failures.count, 0)
    }
}
