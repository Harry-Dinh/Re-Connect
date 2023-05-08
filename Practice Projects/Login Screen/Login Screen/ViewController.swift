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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self
    }
    
    /// Dismiss the keyboard based on which one is currently the first responder.
    @objc func dismissKeyboard() {
        if emailField.isFirstResponder && !passwordField.isFirstResponder {
            emailField.resignFirstResponder()
        } else if !emailField.isFirstResponder && passwordField.isFirstResponder {
            passwordField.resignFirstResponder()
        }
    }
}

extension ViewController: UITextFieldDelegate, UIToolbarDelegate {
    
    /// Set up the behaviour and appearance of the dismiss button for the keyboard.
    /// - Returns: The dismiss button with all of its behaviours implemented
    func setupKeyboardDismissButton() -> UIBarButtonItem {
        let dismissButton = UIBarButtonItem()
        dismissButton.image = UIImage(systemName: "keyboard.chevron.compact.down")
        dismissButton.action = #selector(dismissKeyboard)
        return dismissButton
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.items = [.flexibleSpace(), setupKeyboardDismissButton()]
        keyboardToolbar.sizeToFit()
        emailField.inputAccessoryView = keyboardToolbar
        passwordField.inputAccessoryView = keyboardToolbar
        return true
    }
}
