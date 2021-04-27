//
//  VideoCamera.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-04-08.
//

import SwiftUI
import UIKit

struct VideoCamera: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.showsCameraControls = true
        vc.cameraFlashMode = .auto
        vc.cameraCaptureMode = .video
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // No operations
    }
}
