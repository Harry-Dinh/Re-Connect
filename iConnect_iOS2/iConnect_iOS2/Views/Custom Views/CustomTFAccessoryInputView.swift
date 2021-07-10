//
//  CustomTFAccessoryInputView.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-05-10.
//

import SwiftUI
import UIKit

struct CustomTFAccessoryInputView: UIViewRepresentable {
    
    var hint: String
    @Binding var text: String
    @Binding var containerHeight: CGFloat
    
    func makeCoordinator() -> Coordinator {
        return CustomTFAccessoryInputView.Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UITextView {
        
        let textView = UITextView()
        textView.text = hint
        textView.textColor = UIColor(Color(.placeholderText))
        textView.backgroundColor = .clear
        textView.font = .systemFont(ofSize: 20)
        textView.delegate = context.coordinator
        
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        DispatchQueue.main.async {
            if containerHeight == 300 {
                containerHeight = uiView.contentSize.height
            }
        }
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: CustomTFAccessoryInputView
        
        init(parent: CustomTFAccessoryInputView) {
            self.parent = parent
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            NewPostVM.shared.isEditing = true
            
            if textView.text == parent.hint {
                textView.text = ""
                textView.textColor = UIColor(Color.primary)
            }
        }
        
        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
            parent.containerHeight = textView.contentSize.height
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            NewPostVM.shared.isEditing = false
            
            if textView.text == "" {
                textView.text = parent.hint
                textView.textColor = UIColor(Color(.systemGray4))
            }
        }
    }
}
