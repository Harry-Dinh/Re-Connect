//
//  ImagePicker.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-25.
//

import SwiftUI
import UIKit
import Firebase

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage
    @Environment(\.presentationMode) private var presentationMode
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
                return
            }
            
            DispatchQueue.main.async {
                self.parent.selectedImage = image
            }
            
            guard let imageData = image.pngData() else {
                return
            }
            
            ProfileVM.shared.profilePicData = imageData
            print("Successfully assigned image data to profile view model.")
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.allowsEditing = true
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // No operations
    }
}
