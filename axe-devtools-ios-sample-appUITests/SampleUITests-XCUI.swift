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
        axe = try? AxeDevTools.login(withAPIKey: "Your_API_Key")

        app.launch()
    }

    func testAccessibility() throws {
        let result = try axe?.run(onElement: app)

        // Fail the build if accessibility issues are found.
        XCTAssertEqual(result?.failures.count, 0)
    }
}
