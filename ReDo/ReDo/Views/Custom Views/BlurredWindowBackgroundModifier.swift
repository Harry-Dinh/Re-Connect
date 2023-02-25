//
//  BlurredWindowBackgroundModifier.swift
//  ReDo
//
//  Created by Harry Dinh on 2023-02-25.
//

import Foundation
import SwiftUI
import AppKit

struct BlurredWindowBackgroundModifier: NSViewRepresentable {
    func makeNSView(context: Context) -> NSVisualEffectView {
        let effectView = NSVisualEffectView()
        effectView.state = .active
        return effectView
    }
    
    func updateNSView(_ nsView: NSVisualEffectView, context: Context) {
        // No operations
    }
}
