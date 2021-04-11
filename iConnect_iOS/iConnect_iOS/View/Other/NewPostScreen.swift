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
    @State private var showPostPreview = false
    @State private var showKeyboardDismissButton = false
    @State private var isEditing = false
    
    var body: some View {
        ZStack {
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
                            TextField("Title", text: $model.postTitle) { isEditing in
                                self.isEditing = isEditing
                            } onCommit: {
                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                UIApplication.shared.sendAction(#selector(UIResponder.becomeFirstResponder), to: model.postBody, from: nil, for: nil)
                            }
                        }
                        
                        Section(header: Text("Body")) {
                            TextEditor(text: $model.postBody)
                                .frame(height: 250)
                        }
                        
                        Section(header: Text("Media")) {
                            Button(action: {
                                model.presentPhotoActionSheet.toggle()
                            }, label: {
                                Label("Add Photos", systemImage: "photo")
                            })
                            .actionSheet(isPresented: $model.presentPhotoActionSheet, content: {
                                ActionSheet(title: Text("Insert Media From..."), message: nil, buttons: [
                                    .default(Text("Camera"), action: { model.presentCamera.toggle() }),
                                    .default(Text("Library"), action: { model.presentPhotoPicker.toggle() }),
                                    .cancel()
                                ])
                            })
                            
                        }
                    }
                    else {
                        Section {
                            TextField("Story Title", text: $model.storyTitle)
                        }
                        
                        Section {
                            
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    if !model.storyOrPost {
                        Button(action: {
                            showPostPreview = true
                        }, label: {
                            Text("Preview")
                        })
                        .disabled(model.postTitle.isEmpty && model.postBody.isEmpty || !model.postTitle.isEmpty && model.postBody.isEmpty ? true : false)
                        
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
                        Image(systemName: "eye")
                            .imageScale(.large)
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        let date = Date()
                        let dateString = model.dateFormatter.string(from: date)
                        DatabaseManager.shared.writeTextPostToFirestore(body: model.postBody, title: model.postTitle, date: dateString, uuid: UUID().uuidString, liked: false)
                        
                        model.postTitle = ""
                        model.postBody = ""
                        
                        HomeVM.shared.showNewPostScreen = false
                    }, label: {
                        Image(systemName: model.storyOrPost ? "plus.rectangle.portrait" : "arrow.up.circle")
                    })
                    .disabled(model.postTitle.isEmpty && model.postBody.isEmpty || !model.postTitle.isEmpty && model.postBody.isEmpty ? true : false)
                }
            }
            .navigationTitle(model.storyOrPost ? "Create New Story" : "Create New Post")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action: {
                model.showDiscardNewPostAlert.toggle()
            }, label: {
                Text("Cancel")
            }))
            .blur(radius: showPostPreview ? 30 : 0)
            .alert(isPresented: $model.showDiscardNewPostAlert) {
                Alert(title: Text("Discard Item?"), message: Text("Are you sure you want to discard this item? Everything you edited here will be deleted."),
                      primaryButton: .destructive(Text("Discard"), action: {
                        model.postTitle = ""
                        model.postBody = ""
                        
                        HomeVM.shared.showNewPostScreen = false
                      }),
                      secondaryButton: .cancel(Text("Keep Editing")))
            }
            
            if showPostPreview {
                withAnimation {
                    PostViewPreview(previewName: PostVM.shared.username, previewTitle: model.postTitle, previewBody: model.postBody, showPostPreview: $showPostPreview)
                }
            }
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
