//
//  RenameUI.swift
//  JotEm
//
//  Created by Harry Dinh on 2021-03-16.
//

import SwiftUI

struct RenameUI: View {
    
    @ObservedObject var model = NoteModel.shared
    @Binding var dismissView: Bool
    
    var body: some View {
        VStack {
            
            Text("Rename Note")
                .font(.title2)
                .fontWeight(.semibold)
            
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color.gray.opacity(0.3))
                
                TextField("Enter a new name", text: $model.newNoteTitle)
                    .padding(.horizontal)
                    .font(.system(size: 20))
                    .frame(width: 350, height: 52)
            }
            .frame(width: 350, height: 52)
            
            CustomEmptyView(width: nil, height: 13, color: .clear)
            
            HStack {
                Button(action: {
                    withAnimation {
                        dismissView = true
                    }
                }, label: {
                    Text("Cancel")
                        .foregroundColor(.white)
                })
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).foregroundColor(.gray))
                
                Button(action: {
                    model.noteTitle = model.newNoteTitle
                    
                    withAnimation {
                        dismissView = true
                    }
                }, label: {
                    Text("Rename")
                        .foregroundColor(.white)
                })
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).foregroundColor(.blue))
            }
        }
        .frame(width: 350)
    }
}
