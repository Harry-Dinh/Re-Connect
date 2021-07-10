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
                ScrollView(.vertical, showsIndicators: false) {
                    GroupBox {
                        TextField("Title (optional)", text: $viewModel.postTitleField)
                    }
                    
                    GroupBox(label: Text("Post Body"), content: {
                        TextEditor(text: $viewModel.postBodyField)
                            .font(.system(size: 20))
                            .cornerRadius(7)
                    })
                    .frame(height: 400)
                }
                .padding()
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        
                        Menu {
                            Section {
                                Button(action: {}, label: {
                                    Label("Photo Library", systemImage: "photo")
                                })
                            }
                            
                            Section {
                                Button(action: {
                                    viewModel.changeCameraCapturingMode = false
                                    viewModel.showCamera.toggle()
                                }, label: {
                                    Label("Take Photo", systemImage: "camera")
                                })
                                
                                Button(action: {
                                    viewModel.changeCameraCapturingMode = true
                                    viewModel.showVideoCam.toggle()
                                }, label: {
                                    Label("Capture Video", systemImage: "video")
                                })
                            }
                        } label: {
                            Image(systemName: "photo.on.rectangle.angled")
                                .imageScale(.large)
                        }
                        .sheet(isPresented: $viewModel.showCamera, content: {
                            CameraView(switchCapturingMode: $viewModel.changeCameraCapturingMode)
                        })
                        .sheet(isPresented: $viewModel.showVideoCam, content: {
                            CameraView(switchCapturingMode: $viewModel.changeCameraCapturingMode)
                        })

                        
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
