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
        ZStack {
            if model.renameTitle {
                CustomRenameAlert()
            }
            else {
                TextEditor(text: $model.noteBody)
                    .padding()
                    .navigationTitle(model.noteTitle)
                    .navigationBarTitleDisplayMode(.large)
                    .toolbar(content: {
                        Button(action: {
                            model.renameTitle.toggle()
                        }, label: {
                            Image(systemName: "pencil")
                                .imageScale(.large)
                        })
                        
                        Menu {
                            Button(action: {
                                DatabaseManager.shared.uploadNotesToDatabase(with: model)
                            }, label: {
                                HStack {
                                    Text("Save")
                                    Image(systemName: "checkmark.square")
                                        .imageScale(.large)
                                }
                            })
                        } label: {
                            Image(systemName: "ellipsis.circle")
                                .imageScale(.large)
                        }

                    })
            }
        }
    }
}

struct EditorView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EditorView()
        }
    }
}
