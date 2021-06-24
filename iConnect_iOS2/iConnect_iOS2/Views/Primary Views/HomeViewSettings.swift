//
//  HomeViewSettings.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-06-14.
//

import SwiftUI

struct HomeViewSettings: View {
    
    @State private var tempPicker = 1
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Change View").foregroundColor(.secondary)) {
                    Button(action: {}, label: {
                        HStack {
                            Text("Home")
                            Spacer()
                            Image(systemName: "house")
                                .imageScale(.large)
                                .frame(width: 30)
                        }
                    })
                    .frame(height: 40)
                    
                    Button(action: {}, label: {
                        HStack {
                            Text("Personalized")
                            Spacer()
                            Image(systemName: "heart")
                                .imageScale(.large)
                                .frame(width: 30)
                        }
                    })
                    .frame(height: 40)
                    
                    Button(action: {}, label: {
                        HStack {
                            Text("Followers Only")
                            Spacer()
                            Image(systemName: "person.3")
                                .imageScale(.large)
                                .frame(width: 30)
                        }
                    })
                    .frame(height: 40)
                }
                
                Section(header: Text("Ads Permission").foregroundColor(.secondary)) {
                    Button(action: {}, label: {
                        HStack {
                            Text("Allow Ads")
                            Spacer()
                            Image(systemName: "checkmark.circle")
                                .imageScale(.large)
                                .frame(width: 30)
                        }
                    })
                    .frame(height: 40)
                    
                    Button(action: {}, label: {
                        HStack {
                            Text("Don't Allow Ads")
                            Spacer()
                            Image(systemName: "xmark.circle")
                                .imageScale(.large)
                                .frame(width: 30)
                        }
                    })
                    .frame(height: 40)
                }
                
                Section(header: Text("Privacy").foregroundColor(.secondary)) {
                    NavigationLink(destination: Text("")) {
                        Text("Manage Audience")
                    }
                    .frame(height: 40)
                    
                    Button(action: {}, label: {
                        HStack {
                            Text("Disable Dislikes")
                            Spacer()
                            Image(systemName: "hand.thumbsdown")
                                .imageScale(.large)
                                .frame(width: 30)
                        }
                    })
                    .frame(height: 40)
                    
                    Button(action: {}, label: {
                        HStack {
                            Text("Disable Comments")
                            Spacer()
                            Image(systemName: "text.bubble")
                                .imageScale(.large)
                                .frame(width: 30)
                        }
                    })
                    .frame(height: 40)
                }
            }
            .foregroundColor(.primary)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    CustomNavTitle(title: "Home Settings", summaryLine: "Personalized • Allow Ads • Anyone", icon: Image(systemName: "gear"), iconTint: .white, iconBackgroundTint: .secondary, secondaryInfo: true)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        HomeVM.shared.showViewSettings = false
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                    })
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct HomeViewSettings_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewSettings()
    }
}
