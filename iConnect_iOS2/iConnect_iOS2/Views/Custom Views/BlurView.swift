//
//  BlurView.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-05-02.
//

import SwiftUI
import UIKit

struct BlurView: UIViewRepresentable {
    
    @Environment(\.colorScheme) var colorScheme
    
    func makeUIView(context: Context) -> UIView {
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: colorScheme == .light ? .systemUltraThinMaterialLight : .systemUltraThinMaterialDark))
        return blurView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        // No operations
    }
}