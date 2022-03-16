//
//  PhotoPicker.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-03-06.
//

import SwiftUI
import Firebase

struct PhotoPicker: UIViewControllerRepresentable {
    
    @Binding var image: UIImage?
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: PhotoPicker
        
        init(parent: PhotoPicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            parent.image = info[.editedImage] as? UIImage
            
            // Upload image
            let uid = AuthVM.getUID()!
            let path = Storage.storage().reference().child("Profile Pics").child(uid)
            
            guard let imageData = parent.image?.jpegData(compressionQuality: 0.5) else { return }
            
            path.putData(imageData, metadata: nil) { metadata, error in
                if let error = error {
                    print("Cannot upload image data\nError: \(error.localizedDescription)")
                    return
                }
                
                path.downloadURL { url, error in
                    if let error = error {
                        print("Cannot download image url\nError: \(error.localizedDescription)")
                    }
                    
                    print("Successfully download URL\nURL: \(url?.absoluteString ?? "No URL")")
                    ProfileVM.shared.user.profilePicURL = url?.absoluteString
                }
            }
            
            picker.dismiss(animated: true)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.image = nil
            picker.dismiss(animated: true)
        }
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}
