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
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Profile Picture")) {
                    HStack {
                        Spacer()
                        
                        if let image = vm.profilePic {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 200)
                                .clipShape(Circle())
                                .padding()
                                .onTapGesture {
                                    vm.showPhotoPicker.toggle()
                                }
                                .sheet(isPresented: $vm.showPhotoPicker, content: { PhotoPicker(image: $vm.profilePic) })
                        }
                        else {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .frame(width: 200, height: 200)
                                .foregroundColor(.secondary)
                                .padding()
                                .onTapGesture {
                                    vm.showPhotoPicker.toggle()
                                }
                                .sheet(isPresented: $vm.showPhotoPicker, content: { PhotoPicker(image: $vm.profilePic) })
                        }
                        
                        Spacer()
                    }
                    .listRowBackground(Color.clear)
                    
                    Button(action: {
                        vm.profilePic = nil
                    }) { Label("Clear Profile Picture", systemImage: "trash").foregroundColor(.red) }
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
                    
                    Stepper("Age \(vm.user.age)", value: $vm.user.age)
                    
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
                }
                
                Section(header: Label("Bio", systemImage: "textformat.alt")) {
                    TextEditor(text: $vm.user.bio)
                        .focused($focusedField, equals: .bio)
                        .frame(height: 150)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Edit Your Profile")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        vm.profilePic = nil
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button("Save") {
                        vm.updateUserInfo(user: vm.user)
                        ProfileVM.getUserInfo()
                        presentationMode.wrappedValue.dismiss()
                    }
                    .font(.system(size: 17, weight: .semibold, design: .default))
                }
                
                ToolbarItemGroup(placement: .keyboard) {
                    HStack {
                        Spacer()
                        Button("Done") { focusedField = nil }
                    }
                }
            }
        }
        .interactiveDismissDisabled()
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
