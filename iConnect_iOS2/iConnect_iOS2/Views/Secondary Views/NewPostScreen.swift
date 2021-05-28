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
        
        VStack(spacing: 0) {
            ZStack {
                Color(.systemBackground)
                    .ignoresSafeArea(.container, edges: .top)
                
            HStack(alignment: .center, spacing: 15) {
                Text("Create New Post")
                    .font(Font.custom("Oxanium", size: 20))
                    .bold()
                    .foregroundColor(.accentColor)
                Spacer()
                
                Button(action: {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }, label: {
                    ZStack {
                        Circle()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color(.systemGray5))
                        
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                })
                
                Button(action: {
                    viewModel.showNewPost = false
                }, label: {
                    ZStack {
                        Capsule()
                            .foregroundColor(Color(.systemGray5))
                        
                        Text("Cancel")
                            .fontWeight(.medium)
                    }
                })
                .frame(width: 80, height: 30)
            }
                .padding(.horizontal)
            }
            .frame(height: 50)
            
            Divider()
            
            // MARK: - Start of editing form
            ScrollView {
                VStack {
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color(.systemGray6))
                            .cornerRadius(10.0)
                        
                        TextField("Title (optional)", text: $viewModel.postTitleField) { (isEditing) in
                            viewModel.isEditing = isEditing
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 7)
                    }
                    
                    Divider()
                    
                    CustomTFAccessoryInputView(hint: "Aa", text: $viewModel.postBodyField, containerHeight: $viewModel.containerHeight)
                        .frame(height: viewModel.containerHeight)
                        .padding(.leading, 3)
                }
                .padding(.vertical)
                .padding(.horizontal, 7)
            }
            
            // Bottom toolbar
            Divider()
            
            HStack(spacing: 0) {
                
                // Left toolbar section
                HStack(spacing: 0) {
                    Button(action: {}, label: {
                        ZStack {
                            Capsule()
                                .foregroundColor(Color(.systemGray5))
                            
                            Text("Preview")
                        }
                        .frame(width: 90,height: 30)
                    })
                    
                    CustomEmptyView(width: 15, height: 30, foregroundColor: .clear)
                    
                    Button(action: {}, label: {
                        ZStack {
                            Circle()
                                .foregroundColor(Color(.systemGray5))
                            
                            Image(systemName: "tag")
                                .font(.headline)
                        }
                        .frame(width: 35, height: 35)
                    })
                    
                    CustomEmptyView(width: 15, height: 30, foregroundColor: .clear)
                    
                    Menu {
                        Section {
                            Button(action: {}, label: {
                                Label("Photo Library", systemImage: "photo.on.rectangle.angled")
                            })
                            
                            Button(action: {}, label: {
                                Label("Take Photo", systemImage: "camera")
                            })
                            
                            Button(action: {}, label: {
                                Label("Record Video", systemImage: "video")
                            })
                        }
                        
                        Section {
                            Button(action: {}, label: {
                                Label("Documents", systemImage: "doc")
                            })
                        }
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundColor(Color(.systemGray5))
                            
                            Image(systemName: "paperclip")
                                .font(.headline)
                        }
                        .frame(width: 35, height: 35)
                    }
                }
                
                Spacer()
                
                HStack(spacing: 0) {
                    Button(action: {}, label: {
                        ZStack {
                            Circle()
                                .foregroundColor(Color(.systemGray5))
                            
                            Image(systemName: "person.2")
                                .font(.headline)
                        }
                        .frame(width: 35, height: 35)
                    })
                    
                    CustomEmptyView(width: 15, height: 30, foregroundColor: .clear)
                    
                    Button(action: {}, label: {
                        ZStack {
                            Circle()
                                .foregroundColor(Color(.systemGray5))
                            
                            Image(systemName: "doc.badge.gearshape")
                                .font(.headline)
                        }
                        .frame(width: 35, height: 35)
                    })
                    
                    CustomEmptyView(width: 15, height: 30, foregroundColor: .clear)
                    
                    Button(action: {
                        let datePosted = Date()
                        
                        viewModel.writeTextPostToDatabase(title: viewModel.postTitleField, body: viewModel.postBodyField, datePosted: datePosted)
                        
                        viewModel.postTitleField = ""
                        viewModel.postBodyField = ""
                        
                        viewModel.showNewPost = false
                    }, label: {
                        ZStack {
                            Circle()
                                .foregroundColor(.accentColor)
                            Image(systemName: "arrow.up")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .frame(width: 35, height: 35)
                    })
                    .disabled(viewModel.postTitleField.isEmpty && viewModel.postBodyField.isEmpty || !viewModel.postTitleField.isEmpty && viewModel.postBodyField.isEmpty ? true : false)
                }
            }
            .frame(height: 30)
            .frame(maxWidth: UIScreen.main.bounds.width)
            .padding(.all, 10)
            .ignoresSafeArea(.keyboard)
        }
    }
}

struct NewPostScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewPostScreen()
            .preferredColorScheme(.light)
    }
}
