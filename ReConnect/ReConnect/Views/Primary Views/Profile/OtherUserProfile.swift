//
//  OtherUserProfile.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-08-07.
//

import SwiftUI
import Firebase

struct OtherUserProfile: View {
    
    var displayName: String
    var username: String
    var isPrivateAccount: Bool
    var uid: String
    var followingCount: Int = 0
    var isFollowing: Bool = false
    
    var body: some View {
        ScrollView {
            HStack {
                Image(systemName: "person.crop.circle.fill")
                    .font(.system(size: 100))
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(displayName)
                        .font(.title)
                        .bold()
                    
                    if isPrivateAccount {
                        Label(username, systemImage: "lock.fill")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    else {
                        Label(username, systemImage: "lock.open.fill")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                
                Spacer()
            }
            .padding()
            
            Button(action: {
                followUser(otherUserUID: uid)
            }, label: {
                CustomGroupBox {
                    EmptyView()
                } contentView: {
                    if !isFollowing {
                        Label("Follow", systemImage: "person.fill")
                            .font(.title3, weight: .bold)
                    }
                    else {
                        Label("Followed", systemImage: "person.fill.checkmark")
                            .foregroundColor(.green)
                            .font(.title3, weight: .bold)
                    }
                }
            })
            .padding(.horizontal)
            
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
                        if followingCount == 0 {
                            Text("\(followingCount)")
                                .font(.system(.title, design: .rounded))
                                .fontWeight(.semibold)
                                .foregroundColor(.secondary)
                        }
                        else if followingCount > 0 {
                            Text("\(followingCount)")
                                .font(.system(.title, design: .rounded))
                                .fontWeight(.semibold)
                        }
                        
                        Text("Following")
                    }
                })
            }
            .padding(.horizontal)
            
            HStack {
                Button(action: {}, label: {
                    CustomGroupBox {
                        EmptyView()
                    } contentView: {
                        VStack(spacing: 6) {
                            Image(systemName: "message.fill")
                                .imageScale(.large)
                            Text("Message")
                        }
                        .foregroundColor(.primary)
                    }
                })
                
                Button(action: {}, label: {
                    CustomGroupBox {
                        EmptyView()
                    } contentView: {
                        VStack(spacing: 6) {
                            Image(systemName: "info.circle.fill")
                                .imageScale(.large)
                            Text("See Info")
                        }
                        .foregroundColor(.primary)
                    }
                })
                
                Menu {
                    Section {
                        Button(action: {}, label: {
                            Label("Report User", systemImage: "exclamationmark.triangle")
                        })
                        
                        Button(action: {}, label: {
                            Label("Block User", systemImage: "nosign")
                        })
                    }
                    
                    Section {
                        Button(action: {}, label: {
                            Label("Scan to Follow", systemImage: "qrcode")
                        })
                        
                        Button(action: {}, label: {
                            Label("Share", systemImage: "square.and.arrow.up")
                        })
                    }
                } label: {
                    CustomGroupBox {
                        EmptyView()
                    } contentView: {
                        VStack(spacing: 6) {
                            Image(systemName: "ellipsis.circle.fill")
                                .imageScale(.large)
                            Text("More")
                        }
                        .foregroundColor(.primary)
                    }
                }

            }
            .padding(.horizontal)
        }
        .navigationTitle(displayName)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    /// Execute actions to follow a user
    func followUser(otherUserUID: String) {
        let currentUserUID = HelperMethods.shared.getCurrentUserUID()
        
        // Add user to Database
        let databaseRef = Database.database().reference()
        let databasePath = databaseRef.child("Users").child(currentUserUID).child("followers").child(otherUserUID)
        
        let otherUserInfo: [String: Any] = [
            "followerUID": otherUserUID
        ]
        
        databasePath.updateChildValues(otherUserInfo)
        
        // Get rid of the default value of following count then add 1 when the user follow somebody.
        var followingCounter: Int = 0
        followingCounter += 1
        
        // Update Firestore
        let firestoreRef = Firestore.firestore()
        let firestorePath = firestoreRef.collection("users")
        firestorePath.whereField("uid", isEqualTo: currentUserUID).getDocuments { snapshot, error in
            
            if let error = error {
                print(error)
            }
            else if snapshot?.documents.count != 1 {
                print("No documents")
            }
            else {
                let doc = snapshot?.documents.first?.reference
                
                let updatedValues: [String: Any] = [
                    "followingCount": followingCounter
                ]
                
                doc?.updateData(updatedValues)
            }
        }
    }
}

struct OtherUserProfile_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            OtherUserProfile(displayName: "Harry Dinh", username: "@HarryTDA16", isPrivateAccount: true, uid: "asdasd")
        }
    }
}
