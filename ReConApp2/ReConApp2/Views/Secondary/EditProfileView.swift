//
//  EditProfileView.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-02-27.
//

import SwiftUI

struct EditProfileView: View {
    
    @ObservedObject var vm = ProfileVM.shared
    @FocusState var focusedField: ProfileVM.Fields?
    @Environment(\.presentationMode) var presentationMode
    
    @State private var textEditorHeight: CGFloat = 20
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Profile Photo")) {
                    HStack {
                        Spacer()
                        
                        if let image = vm.profilePic {
                            VStack(spacing: 5) {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 150, height: 150)
                                    .clipShape(Circle())
                                    .onTapGesture {
                                        vm.showPhotoPicker.toggle()
                                    }
                                    .sheet(isPresented: $vm.showPhotoPicker, content: { PhotoPicker(image: $vm.profilePic) })
                                
                                if !vm.showEditPfpSpinner {
                                    HStack {
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(.green)
                                            .frame(width: 20)
                                        Text("SUCCESSFULLY UPLOADED")
                                            .font(.footnote)
                                            .foregroundColor(.secondary)
                                    }
                                }
                                else {
                                    HStack {
                                        ProgressView()
                                            .frame(width: 20)
                                        Text("UPLOADING")
                                            .font(.footnote)
                                            .foregroundColor(.secondary)
                                    }
                                }
                            }
                            .listRowSeparator(.hidden)
                        }
                        else {
                            VStack(spacing: 5) {
                                Image(systemName: "person.crop.circle.fill")
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .foregroundColor(.secondary)
                                    .onTapGesture {
                                        vm.showPhotoPicker.toggle()
                                    }
                                .sheet(isPresented: $vm.showPhotoPicker, content: { PhotoPicker(image: $vm.profilePic) })
                                
                                if !vm.showEditPfpSpinner {
                                    HStack {
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundColor(.green)
                                            .frame(width: 20)
                                        Text("SUCCESSFULLY UPLOADED")
                                            .font(.footnote)
                                            .foregroundColor(.secondary)
                                    }
                                }
                                else {
                                    HStack {
                                        ProgressView()
                                            .frame(width: 20)
                                        Text("UPLOADING")
                                            .font(.footnote)
                                            .foregroundColor(.secondary)
                                    }
                                }
                            }
                        }
                        
                        Spacer()
                    }
                    .listRowBackground(Color.clear)
                    
                    Button(action: {
                        vm.profilePic = nil
                    }) { Label("Clear Profile Photo", systemImage: "trash").foregroundColor(.red) }
                    
//                    Button(action: {
//                        UIPasteboard.general.string = vm.user.profilePicURL
//                    }) {
//                        Label("Copy Photo URL", systemImage: "doc.on.doc")
//                    }
                    
                    Button(action: { vm.showAlertProfilePicURL.toggle() }) {
                        Label("Show Photo URL", systemImage: "link")
                    }
                    .alert(isPresented: $vm.showAlertProfilePicURL) {
                        Alert(title: Text("Profile Photo URL"), message: Text(vm.user.profilePicURL ?? "No URL"),
                              primaryButton: .default(Text("Copy URL"),action: { UIPasteboard.general.string = vm.user.profilePicURL }),
                              secondaryButton: .cancel(Text("Dismiss")))
                    }
                }
                
                Section(header: Label("Basic Info", systemImage: "info.circle")) {
                    TextField("First name", text: $vm.user.firstName)
                        .textInputAutocapitalization(.words)
                        .submitLabel(.next)
                        .onSubmit { focusedField = .lastName }
                        .focused($focusedField, equals: .firstName)
                    
                    TextField("Last name", text: $vm.user.lastName)
                        .textInputAutocapitalization(.words)
                        .submitLabel(.next)
                        .onSubmit { focusedField = .email }
                        .focused($focusedField, equals: .lastName)
                    
                    TextField("Email address", text: $vm.user.email)
                        .textInputAutocapitalization(.never)
                        .submitLabel(.next)
                        .onSubmit { focusedField = .username }
                        .focused($focusedField, equals: .email)
                        .keyboardType(.emailAddress)
                    
                    Stepper(value: $vm.user.age, in: 13...90, step: 1) {
                        Text("Age \(vm.user.age)")
                    }
                    
                    HStack {
                        Text("Gender:")
                        
                        Spacer()
                        
                        Picker(selection: $vm.user.gender) {
                            Text("Female").tag(0)
                            Text("Male").tag(1)
                            Text("Prefer not to say").tag(2)
                        } label: {
                            Text("Gender")
                        }
                        .pickerStyle(.menu)
                    }
                }
                
                Section(header: Label("Profile Info", systemImage: "person.crop.circle")) {
                    TextField("Username", text: $vm.user.username)
                        .textInputAutocapitalization(.never)
                        .submitLabel(.next)
                        .onSubmit { focusedField = .bio }
                        .focused($focusedField, equals: .username)
                        .keyboardType(.twitter)
                    
                    Toggle(isOn: $vm.user.isPrivateAccount) {
                        Text("Use Private Account")
                    }
                    
                }
                
                // Resizing text editor curtisey of: https://stackoverflow.com/questions/69002861/controlling-size-of-texteditor-in-swiftui
                Section(header: Label("Bio", systemImage: "textformat.alt")) {
                    ZStack(alignment: .leading) {
                        Text(vm.user.bio)
                            .font(.body)
                            .foregroundColor(.clear)
                            .padding(14)
                            .background(
                                GeometryReader {
                                    Color.clear.preference(key: ViewHeightKey.self, value: $0.frame(in: .local).size.height)
                                }
                            )
                        
                        TextEditor(text: $vm.user.bio)
                            .font(.body)
                            .focused($focusedField, equals: .bio)
                            .frame(height: max(40, textEditorHeight))
                    }
                    .onPreferenceChange(ViewHeightKey.self) { textEditorHeight = $0 }
                }
            }
            .listStyle(.grouped)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Edit Your Profile")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        vm.profilePic = nil
                        ProfileVM.getCurrentUserInfo()
                        presentationMode.wrappedValue.dismiss()
                    }
                    .disabled(vm.showEditPfpSpinner)
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button("Save") {
                        vm.updateUserInfo(user: vm.user)
                        vm.profilePic = nil
                        presentationMode.wrappedValue.dismiss()
                    }
                    .font(.system(size: 17, weight: .semibold, design: .default))
                    .disabled(vm.showEditPfpSpinner)
                }
                
                ToolbarItemGroup(placement: .keyboard) {
                    HStack {
                        Spacer()
                        Button("Done") { focusedField = nil }
                    }
                }
            }
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}

struct ViewHeightKey: PreferenceKey {
    static var defaultValue: CGFloat { 0 }
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = value + nextValue()
    }
}
