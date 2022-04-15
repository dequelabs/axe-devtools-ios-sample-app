//
//  axe_devtools_ios_sample_appUITests.swift
//  axe-devtools-ios-sample-appUITests
//
//  Created by Kate Owens on 3/14/22.
//

import axe_devtools_ios_sample_app
import Attest
import XCTest

class axe_devtools_ios_sample_appUITests: XCTestCase {

    var app = XCUIApplication()
    var client: AttestClient?
    let credentials = LoginInfo()

    override func setUp() {
        guard let client = AttestClient(username: credentials.dequeUsername, password: credentials.dequePassword) else {
            XCTFail("Could not log in.")
            return
        }

        Attest.setServer(usingAttestClient: client)
        self.client = client
        app.launch()
    }

    func testExample() throws {
        let FAB_ID = "com.deque.attest.accessibilityFab"
        let fab = app.buttons[FAB_ID]

        // Tap the FAB to send the scan to the server
        fab.tap()

        // Once it returns, the result from the scan can be seen on the Dashboard.
        // The FAB's label has the key needed to retrieve the scan from the server.
        XCTAssert(fab.waitForExistence(timeout: 5))

        // Grab the result from the server
        guard let key = AttestResultKey(fabTitle: fab.label) else {
            XCTFail("Could not retrieve scan from the server.")
            return
        }

        // Tag the result with the tags provided
        client!.tagResult(key, tags: ["sauce testing"])
    }
}
