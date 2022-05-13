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
        axe = try AxeDevTools.login(withUsername: "<YOUR_USERNAME>", andPassword: "<YOUR_PASSWORD>")
    }

    func testHomeViewControllerAccessibility() {
        let view = HomeViewController()
        guard let result = try? axe?.run(onViewController: view) else {
            XCTFail()
            return
        }

        let _ = try? axe?.saveResult(result)
        XCTAssertEqual(result.failures.count, 0)
    }
}
