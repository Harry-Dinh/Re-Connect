//
//  NewPostScreen.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-05-03.
//

import SwiftUI

struct NewPostScreen: View {
    
    @ObservedObject var viewModel = NewPostVM.shared
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "iconnectBlue")
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.label], for: .normal)
    }
    
    var pickerView: some View {
        Picker(selection: $viewModel.storyOrPost, label: Text(""), content: {
            Text("Post").tag(false)
            Text("Story").tag(true)
        })
        .pickerStyle(SegmentedPickerStyle())
    }
    
    var body: some View {
        ZStack {
            
            Color(.secondarySystemBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                ZStack {
                    Color(.systemBackground)
                        .ignoresSafeArea(.container, edges: .top)
                    
                    HStack(alignment: .center) {
                        Text("Create New...")
                            .font(Font.custom("Oxanium", size: 20))
                            .bold()
                            .foregroundColor(.accentColor)
                        Spacer()
                        
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
                
                Form {
                    Section {
                        pickerView
                    }
                    
                    Section(header: Text("Title (optional)")) {
                        TextField("", text: $viewModel.postTitleField)
                    }
                    
                    Section(header: Text("Body")) {
                        TextEditor(text: $viewModel.postBodyField)
                            .frame(height: 400)
                    }
                    
                    Section(header: Text("Add Media...")) {
                        Button(action: {}, label: {
                            Label("From Library", systemImage: "photo.on.rectangle.angled")
                        })
                        
                        Button(action: {}, label: {
                            Label("Open Camera", systemImage: "camera")
                        })
                    }
                }
                
                ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                    Rectangle()
                        .foregroundColor(Color(.secondarySystemBackground))
                    
                    HStack(alignment: .center) {
                        Button(action: {}, label: {
                            ZStack {
                                Capsule()
                                    .foregroundColor(Color(.systemGray5))
                                
                                Text("Preview")
                            }
                        })
                        .frame(width: 95, height: 30)
                        
                        Spacer()
                        
                        Menu {
                            
                        } label: {
                            ZStack {
                                Circle()
                                    .foregroundColor(Color(.systemGray5))
                                
                                Image(systemName: "eye.slash")
                            }
                        }
                        .frame(width: 30)

                        
                        Spacer()
                        
                        Button(action: {}, label: {
                            ZStack {
                                Capsule()
                                    .foregroundColor(.accentColor)
                                
                                Text("Post")
                                    .foregroundColor(.white)
                            }
                        })
                        .frame(width: 65, height: 30)
                    }
                    .padding()
                }
                .frame(height: 50)
            }
        }
    }
}

struct NewPostScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewPostScreen()
            
            
    }
}
