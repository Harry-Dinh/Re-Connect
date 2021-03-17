//
//  TextFieldAlert.swift
//  JotEm
//
//  Created by Harry Dinh on 2021-03-16.
//

import Foundation
import UIKit

class TextFieldAlert {
    static let shared = TextFieldAlert()
    
    public func showAlert() {
        let alert = UIAlertController(title: "Rename Note", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Rename", style: .default, handler: { _ in
            
        }))
    }
}
