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
    }

    func testAccessibility() throws {
        guard let result = try axe?.run(onElement: app) else { XCTFail(); return }
        try axe?.postResult(result)

        // Fail the build if accessibility issues are found.
        XCTAssertEqual(result.failures.count, 0)
    }
}
