//
//  ViewController.swift
//  Login Screen
//
//  Created by Harry Dinh on 2023-05-08.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var createAccountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        setupSignInButton()
        setupCreateAccountButton()
    }
    
    /// Set up the delegates (behaviours) for any views/view controllers
    func setupDelegates() {
        emailField.delegate = self
        passwordField.delegate = self
    }
    
    /// Set up the behaviour and appearance of the sign in button
    func setupSignInButton() {
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
    }
    
    /// Set up the behaviour and appearance of the create account button
    func setupCreateAccountButton() {
        // Setting up label
        
        createAccountLabel.text = "No account? Create one"
        
        // Setting up button
        
        createAccountButton.setTitle("here", for: .normal)
        createAccountButton.addTarget(self, action: #selector(showCreateAccountScreen), for: .touchUpInside)
    }
    
    /// Open a sheet presenting the `CreateAccountViewController` screen.
    @objc func showCreateAccountScreen() {
        navigationController?.present(CreateAccountViewController(), animated: true)
    }
    
    /// An action that simulate an actual authentication action for signing in a user with the email and password.
    @objc func signIn() {
        print("Authentication sequence initiated")
    }
}

extension ViewController: UITextFieldDelegate, UIToolbarDelegate {
    
    // MARK: Custom Functions
    
    /// Dismiss the keyboard based on which one is currently the first responder.
    @objc func dismissKeyboard() {
        if emailField.isFirstResponder && !passwordField.isFirstResponder {
            emailField.resignFirstResponder()
        } else if !emailField.isFirstResponder && passwordField.isFirstResponder {
            passwordField.resignFirstResponder()
        }
    }
    
    /// Set up the behaviour and appearance of the dismiss button for the keyboard.
    /// - Returns: The dismiss button with all of its behaviours implemented
    func setupKeyboardDismissButton() -> UIBarButtonItem {
        let dismissButton = UIBarButtonItem()
        dismissButton.image = UIImage(systemName: "keyboard.chevron.compact.down")
        dismissButton.action = #selector(dismissKeyboard)
        return dismissButton
    }
    
    // MARK: Built-in Functions
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.items = [.flexibleSpace(), setupKeyboardDismissButton()]
        keyboardToolbar.sizeToFit()
        emailField.inputAccessoryView = keyboardToolbar
        passwordField.inputAccessoryView = keyboardToolbar
        return true
    }
}
