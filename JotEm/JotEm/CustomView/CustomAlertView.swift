//
//  CustomAlertView.swift
//  JotEm
//
//  Created by Harry Dinh on 2021-03-16.
//

import Foundation
import UIKit

class CustomAlertView: UITextField {
    
    static let shared = CustomAlertView()
    
    let model = NoteModel.shared
    
    func showAlert() {
        let alert = UIAlertController(title: "Rename Note", message: nil, preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Enter a new name"
            textField.text = self.model.newNoteTitle
            textField.delegate = self
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Rename", style: .default, handler: { [self] _ in
            model.newNoteTitle = model.noteTitle
            print("Renamed")
        }))
        
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true) { [self] in
            model.newNoteTitle = model.noteTitle
        }
    }
}

extension CustomAlertView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text as NSString? {
            self.model.newNoteTitle = text.replacingCharacters(in: range, with: string)
        }
        else {
            self.model.newNoteTitle = "Untitled New Note"
        }
        
        return true
    }
}
