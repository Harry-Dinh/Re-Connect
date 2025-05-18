//
//  RECAuthenticationTests.swift
//  RECAuthenticationTests
//
//  Created by Harry Dinh on 2025-05-12.
//

import XCTest

class RECAuthenticationTests: RECUITests {
    func test_navigateToCreateAccountView() {
        launchApp()
        let createAccountButton = app.buttons["loginCreateAccountButton"]
        if createAccountButton.waitForExistence(timeout: existenceWaitTime) {
            createAccountButton.tap()

            let registerScreenHeader = app.staticTexts["genericListHeaderTitle"]
            XCTAssertTrue(registerScreenHeader.exists)
        } else {
            XCTFail("Create account button not found")
        }
    }

    func test_standardLogin() {
        launchApp()
        loginTestAccount()
        let feedScreenTitle = app.staticTexts["Re:Connect"]     // TODO: Change this to a constant in the future
        if !feedScreenTitle.waitForExistence(timeout: existenceWaitTime) {
            XCTFail("Not logged in or title not found")
        }
    }
}
