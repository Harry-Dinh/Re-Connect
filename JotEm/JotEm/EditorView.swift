//
//  EditorView.swift
//  JotEm
//
//  Created by Harry Dinh on 2021-03-16.
//

import SwiftUI

struct EditorView: View {
    
    @ObservedObject var model = NoteModel.shared
    
    var body: some View {
        TextEditor(text: $model.noteBody)
            .padding()
            .navigationTitle(model.noteTitle)
            .navigationBarItems(trailing: Menu(content: {
                Button(action: {}, label: {
                    HStack {
                        Text("Rename")
                        Image(systemName: "pencil")
                    }
                })
            }, label: {
                Image(systemName: "ellipsis.circle")
                    .imageScale(.large)
            }))
    }
}

struct EditorView_Previews: PreviewProvider {
    static var previews: some View {
        EditorView()
    }
}
