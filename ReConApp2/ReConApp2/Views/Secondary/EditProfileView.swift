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
    
    @State private var textEditorHeight: CGFloat = 20
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView {
            List {
                Picker("Selection", selection: $selectedTab) {
                    Text("Profile Info").tag(0)
                    Text("Basic Info").tag(1)
                }
                .pickerStyle(.segmented)
                .listRowBackground(Color.clear)
                
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
                                        .onTapGesture {
                                            vm.showPhotoPicker.toggle()
                                        }
                                }
                                .sheet(isPresented: $vm.showPhotoPicker, content: { PhotoPicker(image: $vm.profilePic) })
                            }
                            else {
                                VStack(spacing: 5) {
                                    Image(systemName: "person.crop.circle.fill")
                                        .resizable()
                                        .frame(width: 150, height: 150)
                                        .foregroundColor(.accentColor)
                                        .symbolRenderingMode(.hierarchical)
                                        .onTapGesture {
                                            vm.showPhotoPicker.toggle()
                                        }
                                }
                                .sheet(isPresented: $vm.showPhotoPicker, content: { PhotoPicker(image: $vm.profilePic) })
                            }
                            
                            Spacer()
                        }
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        
                        Button(action: { UIPasteboard.general.string = vm.user.profilePicURL }) {
                            Label("Copy Photo URL", systemImage: "link")
                        }
                        
                        Button(action: { vm.profilePic = nil }) {
                            Label("Clear Profile Photo", systemImage: "trash")
                                .foregroundColor(.red)
                        }
                    }
                    
                    Section {
                        Toggle(isOn: $vm.user.isPrivateAccount) {
                            Text("Use Private Account")
                        }
                    }
                    
                    Section(header: Label("Username", systemImage: "at")) {
                        TextField("Username (ie: @JimKirk1701)", text: $vm.user.username)
                            .keyboardType(.twitter)
                            .submitLabel(.next)
                            .onSubmit { focusedField = .bio }
                    }
                    
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
                        .onPreferenceChange(ViewHeightKey.self) {
                            textEditorHeight = $0
                        }
                    }
                }
                else {
                    Section {
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
                }
            }
            .navigationTitle("Edit Your Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Text("Update")
                            .fontWeight(.semibold)
                    }
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
