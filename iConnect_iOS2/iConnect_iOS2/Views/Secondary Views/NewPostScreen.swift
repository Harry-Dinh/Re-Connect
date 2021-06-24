//
//  NewPostScreen.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-05-03.
//

import SwiftUI

struct NewPostScreen: View {
    
    @ObservedObject var viewModel = NewPostVM.shared
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            NavigationView {
                Form {
                    TextField("Title (optional)", text: $viewModel.postTitleField)
                    
                    Section(header: Text("Post body: Describe your contents here...")) {
                        TextEditor(text: $viewModel.postBodyField)
                            .frame(height: 450)
                            .font(.system(size: 18))
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        
                        Menu {
                            Section {
                                Button(action: {}, label: {
                                    Label("Photo Library", systemImage: "photo")
                                })
                            }
                        } label: {
                            Image(systemName: "photo.on.rectangle.angled")
                                .imageScale(.large)
                        }

                        
                        Spacer()
                        
                        Button(action: {}, label: {
                            Image(systemName: "paperclip")
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            viewModel.isPreviewing.toggle()
                        }, label: {
                            Image(systemName: "eye")
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            viewModel.showProgressIndicator = true
                            
                            viewModel.writeTextPostToDatabase(title: viewModel.postTitleField, body: viewModel.postBodyField, datePosted: Date())
                            viewModel.showNewPost = false
                            
                            viewModel.postTitleField = ""
                            viewModel.postBodyField = ""
                            viewModel.showProgressIndicator = false
                        }, label: {
                            if !viewModel.showProgressIndicator {
                                Image(systemName: "arrow.up")
                            }
                            else {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle())
                            }
                        })
                        .disabled(viewModel.postBodyField.isEmpty)
                    }
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("Create New Post")
                            .font(.title3)
                            .bold()
                    }
                    
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button(action: {
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }, label: {
                            Image(systemName: "keyboard.chevron.compact.down")
                        })
                        
                        Button(action: {
                            NewPostVM.shared.showNewPost = false
                        }, label: {
                            Text("Cancel")
                        })
                    }
                }
            }
            
            // Post Preview
            if viewModel.isPreviewing {
                PreviewPost()
            }
        }
    }
}

struct NewPostScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewPostScreen()
            .preferredColorScheme(.light)
    }
}
