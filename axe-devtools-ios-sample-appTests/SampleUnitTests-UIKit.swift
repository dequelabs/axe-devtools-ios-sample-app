//
//  axe_devtools_ios_sample_appTests.swift
//  axe-devtools-ios-sample-appTests
//
//  Created by Kate Owens on 3/14/22.
//

import axeDevToolsUIKit
import XCTest

@testable import axe_devtools_ios_sample_app

class SampleUnitTests: XCTestCase {
    var axe: AxeDevTools?

    override func setUpWithError() throws {
        axe = try AxeDevTools.login(withAPIKey: Login.APIKey)
    }

    func testHomeViewControllerAccessibility() throws {
        let view = HomeViewController()
        guard let result = try axe?.run(onViewController: view) else {
            XCTFail()
            return
        }

        let _ = try axe?.saveResult(result)
        //Fail the build if accessibility issues are found
        XCTAssertEqual(result.failures.count, 0)
    }
}
