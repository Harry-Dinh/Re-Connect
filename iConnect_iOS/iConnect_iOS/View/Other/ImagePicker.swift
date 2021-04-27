//
//  ImagePicker.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-04-06.
//

import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let vc = UIImagePickerController()
        vc.allowsEditing = false
        vc.sourceType = .photoLibrary
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // No operation
    }
}
