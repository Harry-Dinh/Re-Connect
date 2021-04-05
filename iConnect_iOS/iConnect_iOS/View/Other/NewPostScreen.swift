//
//  NewPostScreen.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-30.
//

import SwiftUI

struct NewPostScreen: View {
    
    @ObservedObject var model = NewPostVM.shared
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            Form {
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
                    Section(header: Text("Title")) {
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
                                    .foregroundColor(.blue)
                                Text("Add Photos or Videos")
                            }
                        })
                        
                        if model.addMedia {
                            Button("Choose from Photo Library") {}
                        }
                    }
                }
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                if !model.storyOrPost {
                    Button(action: {
                        
                    }, label: {
                        Text("Preview")
                    })
                    
                    Spacer()
                }
                
                Menu(content: {
                    Picker(selection: $model.selectedPrivacy, label: Text("Visibility"), content: {
                        Label("Visible to Public", systemImage: "globe")
                            .tag(SelectedPostAudience.visibleToPublic)
                        Label("Visible to Followers", systemImage: "person.2")
                            .tag(SelectedPostAudience.visibleToFollowers)
                        Label("Visible to No One", systemImage: "eye.slash")
                            .tag(SelectedPostAudience.visibleToNoOne)
                    })
                }, label: {
                    Image(systemName: "person.3")
                        .imageScale(.large)
                })
                
                Spacer()
                
                Button(action: {
                    let date = Date()
                    let dateString = model.dateFormatter.string(from: date)
                    DatabaseManager.shared.writeTextPostToFirestore(body: model.postBody, title: model.postTitle, date: dateString, uuid: UUID().uuidString)
                    
                    model.postTitle = ""
                    model.postBody = ""
                    
                    HomeVM.shared.showNewPostScreen = false
                }, label: {
                    Image(systemName: model.storyOrPost ? "plus.rectangle.portrait" : "plus.circle")
                })
            }
        }
        .navigationTitle(model.storyOrPost ? "Create New Story" : "Create New Post")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button(action: {
            model.postTitle = ""
            model.postBody = ""
            
            HomeVM.shared.showNewPostScreen = false
        }, label: {
            Text("Cancel")
        }))
    }
}

struct NewPostScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NewPostScreen()
        }
    }
}
