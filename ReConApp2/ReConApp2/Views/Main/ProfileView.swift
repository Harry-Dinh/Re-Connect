//
//  ProfileView.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-02-20.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var vm = ProfileVM.shared
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    HStack {
                        Image(systemName: "person.crop.circle.fill")
                            .font(.system(size: 80))
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("\(vm.user.firstName) \(vm.user.lastName)")
                                .font(.custom("Rubik Light SemiBold", size: 28, relativeTo: .title))
                            Text(vm.user.username)
                                .font(.custom("Rubik", size: 17, relativeTo: .body))
                            
                            switch vm.user.gender {
                            case 0:
                                Text("she/her")
                                    .padding(.horizontal, 7)
                                    .padding(.vertical, 5)
                                    .foregroundColor(.black)
                                    .background(Color.yellow, in: Capsule())
                                    .font(.custom("Rubik", size: 13, relativeTo: .footnote))
                            case 1:
                                Text("he/him")
                                    .padding(.horizontal, 7)
                                    .padding(.vertical, 5)
                                    .foregroundColor(.white)
                                    .background(Color.accentColor, in: Capsule())
                                    .font(.custom("Rubik", size: 13, relativeTo: .footnote))
                            default:
                                EmptyView()
                            }
                        }
                    }
                    
                    Text(vm.user.bio)
                        .font(.subheadline)
                        .italic()
                        .padding(.bottom, 7)
                    
                    HStack {
                        GroupBox {
                            HStack {
                                Spacer()
                                Text("\(vm.user.followerCount)")
                                    .font(.custom("Rubik", size: 28, relativeTo: .title))
                                    .fontWeight(.medium)
                                Spacer()
                            }
                            .padding(.vertical)
                        } label: {
                            Label("FOLLOWERS", systemImage: "person.2")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .cornerRadius(15)
                        
                        GroupBox {
                            HStack {
                                Spacer()
                                Text("\(vm.user.followingCount)")
                                    .font(.custom("Rubik", size: 28, relativeTo: .title))
                                    .fontWeight(.medium)
                                Spacer()
                            }
                            .padding(.vertical)
                        } label: {
                            Label("FOLLOWING", systemImage: "checkmark.circle")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .cornerRadius(15)
                    }
                    
                    VStack {
                        Divider()
                        
                        Picker(selection: .constant(0)) {
                            Text("Posts")
                                .tag(0)
                            Text("Media")
                                .tag(1)
                        } label: {
                            Text("Selection")
                        }
                    .pickerStyle(.segmented)
                    }
                }
                .listRowSeparator(.hidden)
                .headerProminence(.standard)
            }
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}) {
                        Image(systemName: "qrcode")
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: { vm.showEditProfileView.toggle() }) {
                        Image(systemName: "pencil")
                    }
                    .sheet(isPresented: $vm.showEditProfileView, content: EditProfileView.init)
                }
            }
            .refreshable {
                ProfileVM.getUserInfo()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
