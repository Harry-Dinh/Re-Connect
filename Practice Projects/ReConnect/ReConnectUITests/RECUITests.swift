//
//  RECUITests.swift
//  ReConnect
//
//  Created by Harry Dinh on 2025-05-18.
//

import XCTest

class RECUITests: XCTestCase {
    // MARK: - Global Constants
    public let app = XCUIApplication()
    public let existenceWaitTime: TimeInterval = 10

    // MARK: - Commonly Used Functions

    /// Launch the app (call this function at the beginning of every test function!)
    func launchApp() {
        app.launch()
    }

    /// Log in using an existing test account
    func loginTestAccount() {
        let emailField = app.textFields["loginEmailField"]
        if emailField.waitForExistence(timeout: existenceWaitTime) {
            emailField.tap()
            emailField.typeText("harrydinh@gmail.com")
            emailField.swipeUp()

            let passwordField = app.secureTextFields["loginPasswordField"]
            if passwordField.waitForExistence(timeout: existenceWaitTime) {
                passwordField.tap()
                passwordField.typeText("password")

                let loginButton = app.buttons["loginButton"]
                if loginButton.waitForExistence(timeout: existenceWaitTime) {
                    loginButton.tap()
                } else {
                    XCTFail("Login button not found")
                }
            } else {
                XCTFail("Password field not found, test failed")
            }
        } else {
            XCTFail("Email field not found, test failed")
        }
    }
}
