//
//  CreateAccountViewController.swift
//  Login Screen
//
//  Created by Harry Dinh on 2023-05-08.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var navDoneButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        navDoneButton.title = "Done"
        navDoneButton.action = #selector(dismissVC)
    }
    
    @objc private func dismissVC() {
        // This action dismisses the current view controller (with an optional animation)
        navigationController?.popViewController(animated: true)
    }
}
