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
                WebImage(url: URL(string: viewModel.profilePicURL))
                    .resizable()
                    .frame(width: 80, height: 80)
                    .cornerRadius(15)
                
                VStack(alignment: .leading, spacing: 6) {
                    if !viewModel.middleName.isEmpty {
                        Text("\(viewModel.firstName) \(viewModel.middleName) \(viewModel.lastName)")
                            .font(.title)
                            .bold()
                    }
                    else {
                        Text("\(viewModel.firstName) \(viewModel.lastName)")
                            .font(.title)
                            .bold()
                    }
                    
                    if viewModel.isPrivateAccount {
                        Label(viewModel.username, systemImage: "lock.fill")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    else {
                        Label(viewModel.username, systemImage: "lock.open.fill")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
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
                            Text("1.5M")
                                .font(.system(.title, design: .rounded))
                                .fontWeight(.semibold)
                            Text("Followers")
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
                    EmptyView()
                }, contentView: {
                    Label(viewModel.dateOfBirth, systemImage: "gift.fill")
                        .font(.system(.title, design: .default))
                })
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("My Profile")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {}, label: {
                    Image(systemName: "camera.viewfinder")
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
