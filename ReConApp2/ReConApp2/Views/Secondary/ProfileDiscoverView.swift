//
//  ProfileDiscoverView.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-03-17.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileDiscoverView: View {
    
    var user: ReConUser
    @ObservedObject var vm = DiscoverVM.shared
    
    var body: some View {
        List {
            HStack {
                if let url = URL(string: user.profilePicURL ?? "") {
                    WebImage(url: url)
                        .resizable()
                        .scaledToFill()
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
                
                if !user.isPrivateAccount || user.gender == 2 {
                    CustomEmptyView(width: 5, height: nil, color: .clear)
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("\(user.firstName) \(user.lastName)")
                        .font(.system(size: 28, weight: .semibold, design: .default))
                    Text(user.username)
                    
                    HStack {
                        if user.isPrivateAccount {
                            Menu(content: {
                                Text("This user is using a private account")
                            }) {
                                Image(systemName: "lock.fill")
                                    .foregroundColor(.primary)
                            }
                        }
                        
                        switch user.gender {
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
            }
            .listRowSeparator(.hidden)
            
            Text(user.bio)
                .font(.subheadline)
                .italic()
                .padding(.bottom, 7)
                .listRowSeparator(.hidden)
            
            // Controls for users who are not followed by the current user
            HStack {
                Button(action: {
                    vm.followUser(user: user)
                }) {
                    if !vm.showFollowingIndicator {
                        Text("Follow")
                            .fontWeight(.medium)
                            .frame(maxWidth: UIScreen.main.bounds.width)
                            .frame(height: 30)
                    }
                    else {
                        HStack {
                            ProgressView()
                            Text("Following...")
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "ellipsis")
                        .frame(width: 30, height: 30)
                }
                .buttonStyle(.bordered)
            }
            .listRowSeparator(.hidden)
            
            GroupBox {
                Text(user.firebaseUID)
                    .foregroundColor(.secondary)
            }
            .cornerRadius(15)
            .listRowSeparator(.hidden)
            
            HStack {
                GroupBox {
                    HStack {
                        Spacer()
                        Text("\(user.followerCount)")
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
                        Text("\(user.followingCount)")
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
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileDiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileDiscoverView(user: ReConUser(firstName: "Harry", lastName: "Dinh", username: "@HarryTDA", email: "harry@gmail.com", bio: "Re:Connect", age: 17, gender: 1, followerCount: 56, followingCount: 125, firebaseUID: "", profilePicURL: nil, isPrivateAccount: true))
        }
    }
}
