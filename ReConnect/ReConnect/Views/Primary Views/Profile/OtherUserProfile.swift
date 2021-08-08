//
//  OtherUserProfile.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-08-07.
//

import SwiftUI

struct OtherUserProfile: View {
    
    var displayName: String
    var username: String
    var isPrivateAccount: Bool
    
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
            
            Button(action: {}, label: {
                CustomGroupBox {
                    EmptyView()
                } contentView: {
                    Label("Follow", systemImage: "person.fill")
                        .font(.title3, weight: .bold)
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
                        Text("1,576")
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.semibold)
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
}

struct OtherUserProfile_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            OtherUserProfile(displayName: "Harry Dinh", username: "@HarryTDA16", isPrivateAccount: true)
        }
    }
}
