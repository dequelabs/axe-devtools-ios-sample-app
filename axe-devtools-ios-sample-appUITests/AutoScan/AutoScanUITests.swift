//
//  AutoScanUITests.swift
//  axe-devtools-ios-sample-appUITests
//
//  AUTOSCAN — the zero-code path.
//
//  Notice what's NOT here: no `import axeDevToolsXCUI`, no session setup, no
//  scan calls, no report calls. That's the whole point of AutoScan.
//
//  As long as the axeDevToolsXCUI framework is linked to this test target and
//  `axe_config.json` has `"axeAutoScanMode": true`, the framework automatically:
//    1. Starts AutoScan when the test bundle begins.
//    2. Captures and de-duplicates each unique screen as you tap and swipe.
//    3. Scans everything and writes an HTML report when the test bundle finishes.
//
//  AutoScan ships DISABLED in this sample. To try it, open axe_config.json,
//  set `"axeAutoScanMode": true`, and fill in your axeMobileApiKey/axeProjectId.
//  Then just drive the app the way a user would — no other code required.
//
//  Full guide: https://docs.deque.com/devtools-mobile/
//

import XCTest

final class AutoScanUITests: XCTestCase {
    private let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    /// A plain user journey across the app. There is no accessibility code here —
    /// AutoScan captures and scans each screen automatically as these gestures run.
    func testUserJourney() throws {
        for tab in XCUIApplication.sampleTabs {
            app.goToTab(tab)
            app.swipeUp()
            app.swipeDown()
        }
    }
}
