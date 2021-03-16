//
//  TextFieldAlert.swift
//  JotEm
//
//  Created by Harry Dinh on 2021-03-16.
//

import Foundation
import SwiftUI

struct TextFieldAlert: UIViewControllerRepresentable {
    
    @ObservedObject var noteModel = NoteModel.shared
    
    func makeUIViewController(context: Context) -> UIViewController {
        return UIViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        guard context.coordinator.alert == nil else {
            return
        }
        
        if noteModel.renameTitle {
            let alert = UIAlertController(title: "Rename Note", message: nil, preferredStyle: .alert)
            context.coordinator.alert = alert
            
            alert.addTextField { (textField) in
                textField.placeholder = "New Name"
                textField.text = noteModel.newNoteTitle
                textField.delegate = context.coordinator
            }
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Rename", style: .default) { _ in
                noteModel.newNoteTitle = noteModel.noteTitle
            })
            
            DispatchQueue.main.async {
                uiViewController.present(alert, animated: true) {
                    noteModel.renameTitle = false
                    context.coordinator.alert = nil
                }
            }
        }
    }
    
    func makeCoordinator() -> TextFieldAlert.Coordinator { Coordinator(self) }
    
    // MARK: - Coordinator
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var alert: UIAlertController?
        var control: TextFieldAlert
        
        init(_ control: TextFieldAlert) {
            self.control = control
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if let text = textField.text as NSString? {
                self.control.noteModel.noteTitle = text.replacingCharacters(in: range, with: string)
            }
            else {
                self.control.noteModel.noteTitle = "Untitled New Note"
            }
            
            return true
        }
    }
}
