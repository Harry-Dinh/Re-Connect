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
    
    @State private var selectedTab = 0
    
    // Text fields
    // Profile Info
    @State private var isPrivateAccount: Bool = false
    @State private var username: String = ""
    @State private var bio: String = ""
    
    // Basic Info
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var age: Int = -1
    @State private var gender: Int = -1
    
    @State private var textEditorHeight: CGFloat = 20
    @State private var showLoadingIndicator = false
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack {
            if !showLoadingIndicator {
                NavigationView {
                    List {
                        Picker("Selection", selection: $selectedTab) {
                            Text("Profile Info").tag(0)
                            Text("Basic Info").tag(1)
                        }
                        .pickerStyle(.segmented)
                        
                        if selectedTab == 0 {
                            Section(header: Label("Profile Photo", systemImage: "photo")) {
                                HStack {
                                    Spacer()
                                    
                                    if let image = vm.profilePic {
                                        VStack(spacing: 5) {
                                            Image(uiImage: image)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 150, height: 150)
                                                .clipShape(Circle())
                                            
                                            if !vm.showEditPfpSpinner {
                                                HStack {
                                                    Image(systemName: "checkmark.circle.fill")
                                                        .foregroundColor(.green)
                                                        .frame(width: 20)
                                                    Text("SUCCESSFULLY UPLOADED")
                                                        .font(.caption)
                                                        .foregroundColor(.secondary)
                                                }
                                            }
                                            else {
                                                HStack {
                                                    ProgressView()
                                                        .frame(width: 20)
                                                    Text("UPLOADING")
                                                        .font(.caption)
                                                        .foregroundColor(.secondary)
                                                }
                                            }
                                        }
                                    }
                                    else {
                                        VStack(spacing: 5) {
                                            Image(systemName: "person.crop.circle.fill")
                                                .resizable()
                                                .frame(width: 150, height: 150)
                                                .foregroundColor(.accentColor)
                                                .symbolRenderingMode(.hierarchical)
                                            
                                            if !vm.showEditPfpSpinner {
                                                HStack {
                                                    Image(systemName: "checkmark.circle.fill")
                                                        .foregroundColor(.green)
                                                        .frame(width: 20)
                                                    Text("SUCCESSFULLY UPLOADED")
                                                        .font(.caption)
                                                        .foregroundColor(.secondary)
                                                }
                                            }
                                            else {
                                                HStack {
                                                    ProgressView()
                                                        .frame(width: 20)
                                                    Text("UPLOADING")
                                                        .font(.caption)
                                                        .foregroundColor(.secondary)
                                                }
                                            }
                                        }
                                    }
                                    
                                    Spacer()
                                }
                                .listRowBackground(Color.clear)
                                .listRowSeparator(.hidden)
                                
                                Button(action: { vm.showPhotoPicker.toggle() }) {
                                    Label("Photo Library", systemImage: "photo")
                                }
                                .sheet(isPresented: $vm.showPhotoPicker, content: { PhotoPicker(image: $vm.profilePic) })
                                
                                Button(action: {}) {
                                    Label("Take Photo", systemImage: "camera")
                                }
                                
                                Button(action: { vm.profilePic = nil }) {
                                    Label("Clear Profile Photo", systemImage: "trash")
                                        .foregroundColor(.red)
                                }
                            }
                            
                            Section {
                                Toggle(isOn: $isPrivateAccount) {
                                    Text("Use Private Account")
                                }
                            }
                            
                            Section(header: Label("Username", systemImage: "at")) {
                                TextField("Username (ie: @JimKirk1701)", text: $username)
                                    .textInputAutocapitalization(.never)
                                    .submitLabel(.next)
                                    .onSubmit { focusedField = .bio }
                                    .focused($focusedField, equals: .username)
                                    .keyboardType(.twitter)
                            }
                            
                            Section(header: Label("Bio", systemImage: "textformat.alt")) {
                                ZStack(alignment: .leading) {
                                    Text(bio)
                                        .font(.body)
                                        .foregroundColor(.clear)
                                        .padding(14)
                                        .background(
                                            GeometryReader {
                                                Color.clear.preference(key: ViewHeightKey.self, value: $0.frame(in: .local).size.height)
                                            }
                                        )
                                    
                                    TextEditor(text: $bio)
                                        .font(.body)
                                        .focused($focusedField, equals: .bio)
                                        .frame(height: max(40, textEditorHeight))
                                }
                                .onPreferenceChange(ViewHeightKey.self) {
                                    textEditorHeight = $0
                                }
                            }
                        }
                        else {
                            Section {
                                TextField("First name", text: $firstName)
                                    .textInputAutocapitalization(.words)
                                    .submitLabel(.next)
                                    .onSubmit { focusedField = .lastName }
                                    .focused($focusedField, equals: .firstName)
                                
                                TextField("Last name", text: $lastName)
                                    .textInputAutocapitalization(.words)
                                    .submitLabel(.next)
                                    .onSubmit { focusedField = .email }
                                    .focused($focusedField, equals: .lastName)
                                
                                TextField("Email address", text: $email)
                                    .textInputAutocapitalization(.never)
                                    .submitLabel(.next)
                                    .onSubmit { focusedField = .username }
                                    .focused($focusedField, equals: .email)
                                    .keyboardType(.emailAddress)
                                
                                Stepper(value: $age, in: 13...90, step: 1) {
                                    Text("Age: \(age)")
                                }
                                
                                HStack {
                                    Text("Gender:")
                                    
                                    Spacer()
                                    
                                    Picker(selection: $gender) {
                                        Text("Female").tag(0)
                                        Text("Male").tag(1)
                                        Text("Prefer not to say").tag(2)
                                    } label: {
                                        Text("Gender")
                                    }
                                    .pickerStyle(.menu)
                                }
                            }
                        }
                    }
                    .navigationTitle("Edit Your Profile")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button("Cancel") {
                                vm.profilePic = nil
                                presentationMode.wrappedValue.dismiss()
                            }
                            .disabled(vm.showEditPfpSpinner)
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                vm.user.isPrivateAccount = isPrivateAccount
                                vm.user.username = username
                                vm.user.bio = bio
                                vm.user.firstName = firstName
                                vm.user.lastName = lastName
                                vm.user.email = email
                                vm.user.age = age
                                vm.user.gender = gender
                                
                                vm.updateUserInfo(user: vm.user)
                                vm.profilePic = nil
                                ProfileVM.getCurrentUserInfo()
                                presentationMode.wrappedValue.dismiss()
                            }) {
                                Text("Update")
                                    .fontWeight(.semibold)
                            }
                            .disabled(vm.showEditPfpSpinner)
                        }
                        
                        ToolbarItemGroup(placement: .keyboard) {
                            HStack {
                                Spacer()
                                Button(action: { focusedField = nil }) {
                                    Image(systemName: "keyboard.chevron.compact.down")
                                }
                            }
                        }
                    }
                }
            }
            else {
                ProgressView(label: {
                    Label("Getting Your Info", systemImage: "icloud.and.arrow.down")
                })
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 15))
            }
        }
        .onAppear {
            showLoadingIndicator = true
            isPrivateAccount = vm.user.isPrivateAccount
            username = vm.user.username
            bio = vm.user.bio
            firstName = vm.user.firstName
            lastName = vm.user.lastName
            email = vm.user.email
            age = vm.user.age
            gender = vm.user.gender
            showLoadingIndicator = false
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
