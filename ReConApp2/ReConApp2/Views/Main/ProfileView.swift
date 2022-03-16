//
//  ProfileView.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-02-20.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileView: View {
    
    @ObservedObject var vm = ProfileVM.shared
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    HStack {
                        if let url = URL(string: vm.user.profilePicURL!) {
                            WebImage(url: url)
                                .resizable()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .shadow(color: Color.secondary.opacity(0.5), radius: 5, x: 0, y: 0)
                        }
                        else {
                            Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .foregroundColor(.secondary)
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                            .shadow(color: Color.secondary.opacity(0.5), radius: 5, x: 0, y: 0)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("\(vm.user.firstName) \(vm.user.lastName)")
                                .font(.title)
                                .fontWeight(.semibold)
                            Text(vm.user.username)
                            
                            switch vm.user.gender {
                            case 0:
                                Text("she/her")
                                    .padding(.horizontal, 7)
                                    .padding(.vertical, 5)
                                    .foregroundColor(.black)
                                    .background(Color.yellow, in: Capsule())
                                    .font(.footnote)
                            case 1:
                                Text("he/him")
                                    .padding(.horizontal, 7)
                                    .padding(.vertical, 5)
                                    .foregroundColor(.white)
                                    .background(Color.accentColor, in: Capsule())
                                    .font(.footnote)
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
                                    .font(.system(size: 28, weight: .medium, design: .rounded))
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
                                    .font(.system(size: 28, weight: .medium, design: .rounded))
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
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "qrcode")
                    }
                    
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
