//
//  ProfileScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileScreen: View {
    
    @ObservedObject var viewModel = ProfileVM.shared
    
    var body: some View {
        ScrollView {
            HStack {
                if viewModel.unwrappedPFPURL == "" {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .cornerRadius(15)
                }
                else {
                    WebImage(url: URL(string: viewModel.unwrappedPFPURL))
                        .resizable()
                        .frame(width: 80, height: 80)
                        .cornerRadius(15)
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(viewModel.fullName)
                        .font(.title)
                        .bold()
                    
                    if viewModel.isPrivateAccount {
                        Menu {
                            Text("This user is using a Private Account.")
                        } label: {
                            Label(viewModel.username, systemImage: "lock.fill")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    else {
                        Menu {
                            Text("This user is using a Public Account.")
                        } label: {
                            Label(viewModel.username, systemImage: "lock.open.fill")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                
                Spacer()
            }
            .padding([.top, .horizontal])
            
            VStack {
                HStack {
                    CustomGroupBox(titleView: {
                        EmptyView()
                    }, contentView: {
                        VStack(alignment: .center,spacing: 6) {
                            if viewModel.followingCount == 1 {
                                NavigationLink(destination: FollowersList()) {
                                    VStack(spacing: 6) {
                                        Text("\(viewModel.followingCount)")
                                            .font(.system(.title, design: .rounded))
                                            .fontWeight(.semibold)
                                        Text("Follower")
                                    }
                                    .foregroundColor(.primary)
                                }
                            }
                            else if viewModel.followingCount == 0 {
                                NavigationLink(destination: FollowersList()) {
                                    VStack(spacing: 6) {
                                        Text("\(viewModel.followingCount)")
                                            .font(.system(.title, design: .rounded))
                                            .fontWeight(.semibold)
                                            .foregroundColor(.secondary)
                                        Text("Followers")
                                    }
                                    .foregroundColor(.primary)
                                }
                            }
                            else {
                                NavigationLink(destination: EmptyView()) {
                                    VStack(spacing: 6) {
                                        Text("\(viewModel.followingCount)")
                                            .font(.system(.title, design: .rounded))
                                            .fontWeight(.semibold)
                                        Text("Followers")
                                    }
                                    .foregroundColor(.primary)
                                }
                            }
                        }
                    })
                    
                    Spacer()
                    
                    CustomGroupBox(titleView: {
                        EmptyView()
                    }, contentView: {
                        VStack(alignment: .center,spacing: 6) {
                            Text("1,576")
                                .font(.system(.title, design: .rounded))
                                .fontWeight(.semibold)
                            Text("Following")
                        }
                    })

                }
                
                CustomGroupBox(titleView: {
                    Label("Personal Information".uppercased(), systemImage: "info.circle.fill")
                }, contentView: {
                    HStack {
                        VStack(alignment: .leading, spacing: 6) {
                            Label(
                                title: { Text(viewModel.displayEmail) },
                                icon: { Text("Email address:").bold() })
                            
                            Label(
                                title: { Text(viewModel.dateOfBirth) },
                                icon: { Text("Date of Birth:").bold() })
                        }
                        
                        Spacer()
                    }
                })

            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("My Profile")
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: {}, label: {
                    Image(systemName: "camera.viewfinder")
                })
                
                Button(action: {
                    viewModel.showMoreActionsSheet.toggle()
                }, label: {
                    Image(systemName: "ellipsis.circle")
                })
                .sheet(isPresented: $viewModel.showMoreActionsSheet, content: {
                    ProfileMoreActions()
                })
            }
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Edit Profile") {
                    viewModel.editProfile.toggle()
                }
                .sheet(isPresented: $viewModel.editProfile, content: {
                    NavigationView {
                        EditProfile()
                    }
                })
            }
        }
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileScreen()
        }
    }
}
