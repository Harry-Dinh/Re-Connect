//
//  ImagePicker.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-06-25.
//

import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // No operations... yet
    }
}


struct CameraView: UIViewControllerRepresentable {
    
    /// A boolean that specifies the type of media (photos/videos) for the picker to show.
    @Binding var switchCapturingMode: Bool
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.allowsEditing = false
        
        if !switchCapturingMode {
            picker.cameraCaptureMode = .photo
        }
        else {
            picker.cameraCaptureMode = .video
        }
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // No operations... yet
    }
}
