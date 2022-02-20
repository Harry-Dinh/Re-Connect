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
                        }
                    }
                    
                    Text(vm.user.bio)
                        .font(.subheadline)
                        .italic()
                    
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
                            Text("FOLLOWERS")
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
                            Text("FOLLOWINGS")
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
            }
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}) {
                        Image(systemName: "qrcode")
                    }
                    .buttonStyle(.borderedProminent)
                    .clipShape(Circle())
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "pencil")
                    }
                    .buttonStyle(.bordered)
                    .clipShape(Circle())
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
