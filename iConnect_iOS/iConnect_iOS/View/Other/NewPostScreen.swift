//
//  NewPostScreen.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-30.
//

import SwiftUI

struct NewPostScreen: View {
    
    @ObservedObject var model = NewPostVM.shared
    
    var body: some View {
        VStack {
            List {
                Section {
                    Picker(selection: $model.storyOrPost, label: Text(""), content: {
                        Image(systemName: "doc.richtext").tag(false)
                            .imageScale(.large)
                        Image(systemName: "plus.rectangle.portrait").tag(true)
                            .imageScale(.large)
                    })
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                if !model.storyOrPost {
                    Section {
                        TextField("Title", text: $model.postTitle)
                    }
                    
                    Section(header: Text("Body")) {
                        TextEditor(text: $model.postBody)
                            .frame(height: 250)
                    }
                    
                    Section(header: Text("Media")) {
                        Toggle(isOn: $model.addMedia, label: {
                            HStack {
                                Image(systemName: "photo")
                                    .foregroundColor(.blue)
                                Text("Add Photos or Videos")
                            }
                        })
                        
                        if model.addMedia {
                            Button("Choose from Photo Library") {}
                        }
                    }
                }
                else {
                    Section {
                        TextField("Story Title", text: $model.storyTitle)
                    }
                    
                    Section {
                        Toggle(isOn: $model.addMedia, label: {
                            HStack {
                                Image(systemName: "photo")
                                    .foregroundColor(.green)
                                Text("Add Photos or Videos")
                            }
                        })
                        
                        if model.addMedia {
                            Button("Choose from Photo Library") {}
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle(model.storyOrPost ? "New Story" : "New Post")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action: {
                HomeVM.shared.showNewPostScreen = false
            }, label: {
                Text("Cancel")
            }))
            
            Button(action: {
                let date = Date()
                
                DatabaseManager.shared.writeTextPostToDatabase(with: model.postTitle, and: model.postBody, date: date)
            }, label: {
                ZStack {
                    Capsule()
                        .frame(width: 200, height: 52)
                        .foregroundColor(model.storyOrPost ? .green : .blue)
                    Text(model.storyOrPost ? "Share to Story" : "Post")
                        .font(.system(size: 20))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                }
                .padding()
            })
        }
    }
}

struct NewPostScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NewPostScreen()
        }
    }
}
