//
//  TargetedScanUITests.swift
//  axe-devtools-ios-sample-appUITests
//
//  TARGETED SCANNING — the on-demand path.
//
//  You decide exactly which screens to scan and when, by calling
//  `axe.run(onElement:)`. This example walks the four tabs of the sample
//  app, then shows the two ways to report the results:
//    1. Generate a self-contained HTML report + summary locally.
//    2. Upload each scan to the axe Developer Hub dashboard.
//
//  Full guide: https://docs.deque.com/devtools-mobile/
//

import axe_devtools_ios_sample_app
import axeDevToolsXCUI
import XCTest

final class TargetedScanUITests: XCTestCase {
    private var axe: AxeDevTools?
    private let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false

        // Start a scan session against the axe Developer Hub.
        // Add your API key and project ID to Login.swift first:
        //   • API key:    https://axe.deque.com/settings
        //   • Project ID: https://axe.deque.com/axe-watcher/projects
        axe = try AxeDevTools.startScanSession(apiKey: Login.APIKey, projectId: Login.projectId)

        // Experimental rules are still in development; ignore them so they don't run.
        axe?.configuration.ignoreExperimental()

        app.launch()
    }

    /// Scans every tab on demand, then produces ONE HTML report covering all of them.
    ///
    /// `run(onElement:)` accumulates each result on the `axe` instance, so a single
    /// `generateHtmlReportAndSummary()` call at the end bundles every scan into one
    /// self-contained HTML file plus a printed summary.
    func testScanAllTabsAndGenerateHtmlReport() throws {
        let axe = try XCTUnwrap(axe, "axe DevTools didn't start — did you add your API key to Login.swift?")

        for tab in XCUIApplication.sampleTabs {
            app.goToTab(tab)
            _ = try axe.run(onElement: app)
        }

        // One report for the whole journey. Defaults to ~/AxeDevToolsMobileResults.
        let report = try axe.generateHtmlReportAndSummary()
        XCTAssertFalse(report.htmlReportPath.isEmpty, "Expected an HTML report to be written.")
        print("📄 HTML report: \(report.htmlReportPath)")
    }

    /// Scans each tab and uploads the result to the dashboard, showing the common
    /// reporting options: a custom scan name and tags.
    func testScanAllTabsAndUploadToDashboard() throws {
        let axe = try XCTUnwrap(axe, "axe DevTools didn't start — did you add your API key to Login.swift?")

        app.goToTab("Home")
        try axe.postResult(try axe.run(onElement: app), withScanName: "Home Tab")

        app.goToTab("Catalog")
        // Tags make a scan easy to find and share on the dashboard.
        try axe.postResult(try axe.run(onElement: app), withTags: ["smoke", "catalog"], withScanName: "Catalog Tab")
    }

    /// Demonstrates gating a build on accessibility: fail if any CRITICAL issues are found.
    func testHomeScreenHasNoCriticalIssues() throws {
        let axe = try XCTUnwrap(axe, "axe DevTools didn't start — did you add your API key to Login.swift?")

        let result = try axe.run(onElement: app)
        let criticalCount = result.failures.filter { $0.impact == .CRITICAL }.count
        XCTAssertEqual(criticalCount, 0, "Found \(criticalCount) critical accessibility issue(s) on the Home screen.")
    }
}
