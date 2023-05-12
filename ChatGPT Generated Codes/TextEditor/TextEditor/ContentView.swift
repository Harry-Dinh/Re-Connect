//
//  ContentView.swift
//  TextEditor
//
//  Created by Harry Dinh on 2023-05-12.
//

import SwiftUI

struct ContentView: View {
    
    @State private var attributedText = NSMutableAttributedString(string: "")
    @State private var plainText: String = ""
    
    var body: some View {
        VStack {
            TextEditor(text: $plainText)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .border(Color.gray)
                .padding()
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                ControlGroup {
                    Button(action: applyBold) {
                        Label("Bold", systemImage: "bold")
                    }
                    
                    Button(action: applyItalic) {
                        Label("Italic", systemImage: "italic")
                    }
                }
            }
        }
        .onAppear {
            updatePlainText()
        }
    }
    
    private func applyBold() {
        let range = NSRange(location: 0, length: attributedText.length)
        attributedText.addAttribute(.font, value: NSFont.boldSystemFont(ofSize: 14), range: range)
        updatePlainText()
    }
    
    private func applyItalic() {
        let range = NSRange(location: 0, length: attributedText.length)
        guard let currentFont = attributedText.attribute(.font, at: 0, effectiveRange: nil) as? NSFont else {
            return
        }
        
        let italicFont = NSFontManager.shared.convert(currentFont, toHaveTrait: .italicFontMask)
        attributedText.addAttribute(.font, value: italicFont, range: range)
        updatePlainText()
    }
    
    private func updatePlainText() {
        plainText = attributedText.string
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
