//
//  ReConnectUITests.swift
//  ReConnectUITests
//
//  Created by Harry Dinh on 2025-05-12.
//

import XCTest

final class ReConnectUITests: XCTestCase {

    private let app = XCUIApplication()

    // MARK: - Helper Functions
    private func launchApp() {
        app.launch()
    }

    // MARK: - Boiler Plate Code

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - UI Tests

    func test_signInSuccess() throws {
        launchApp()
    }
}
