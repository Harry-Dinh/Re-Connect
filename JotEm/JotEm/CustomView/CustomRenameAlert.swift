//
//  CustomRenameAlert.swift
//  JotEm
//
//  Created by Harry Dinh on 2021-03-17.
//

import UIKit
import SwiftUI

struct CustomRenameAlert: View {
    
    @ObservedObject var model = NoteModel.shared
    
    var body: some View {
        VStack {
            
            Text("Rename Note")
                .font(.title3)
                .fontWeight(.semibold)
            
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color.gray.opacity(0.2))
                
                TextField("Enter a new name", text: $model.newNoteTitle)
                    .padding()
                    .frame(width: 350, height: 52)
                    .font(.system(size: 18))
            }
            .frame(width: 350, height: 52)
            
            CustomEmptyView(width: nil, height: 5, color: .clear)
            
            HStack {
                Button(action: {
                    withAnimation {
                        model.renameTitle = false
                    }
                }, label: {
                    Text("Cancel")
                        .foregroundColor(.white)
                })
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.gray)
                )
                
                Button(action: {
                    model.newNoteTitle = model.noteTitle
                    
                    withAnimation {
                        model.renameTitle = false
                    }
                }, label: {
                    Text("Rename")
                        .foregroundColor(.white)
                })
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.blue)
                )
            }
        }
        .frame(width: 400, height: 250)
        .background(
            BlurView()
                .cornerRadius(25)
        )
    }
}

struct BlurView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemThinMaterial))
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        // No operation
    }
}

struct CustomAlertPreview: PreviewProvider {
    static var previews: some View {
        CustomRenameAlert()
    }
}
