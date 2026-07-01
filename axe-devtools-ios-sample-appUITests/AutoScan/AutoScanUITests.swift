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

    /// A plain user journey across the app, recorded with Xcode's UI test recorder
    /// and then tidied up. There is no accessibility code here — AutoScan captures
    /// and scans each screen automatically as these gestures run.
    func testUserJourney() throws {
        // Home — scroll through the featured content.
        app.collectionViews.containing(.other, identifier: "Vertical scroll bar, 4 pages").firstMatch.swipeUp()
        app.otherElements.matching(identifier: "Horizontal scroll bar, 1 page").element(boundBy: 0).swipeUp()

        // Catalog — browse the categories.
        app.images["Category"].firstMatch.tap()
        app.scrollViews.firstMatch.swipeUp()

        // Cart — add an item.
        app.images["Bag"].firstMatch.tap()
        app.buttons.matching(identifier: "+").element(boundBy: 1).tap()

        // Profile — open and scroll to the help section.
        app.images["Menu"].firstMatch.tap()
        app.cells.containing(.image, identifier: "Info Square").firstMatch.swipeUp()
    }
}
