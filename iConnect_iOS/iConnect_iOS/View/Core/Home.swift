//
//  Home.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-18.
//

import SwiftUI

struct Home: View {
    
    @ObservedObject var model = HomeVM.shared
    var postVM = PostVM.shared
    
    var body: some View {
        VStack {
            HStack {
                Text("iconnect")
                    .font(.system(size: 36, weight: .heavy, design: .rounded))
                    .foregroundColor(.green)
                
                Spacer()
                
                Button(action: {
                    model.showNewPostScreen.toggle()
                }, label: {
                    ZStack {
                        Circle()
                            .frame(width: 35, height: 35)
                            .foregroundColor(Color.green)
                        Image(systemName: "square.and.pencil")
                            .imageScale(.large)
                            .foregroundColor(.white)
                    }
                })
                .fullScreenCover(isPresented: $model.showNewPostScreen, content: {
                    NavigationView {
                        NewPostScreen()
                    }
                })
                
                Button(action: {}, label: {
                    ZStack {
                        Circle()
                            .frame(width: 35, height: 35)
                            .foregroundColor(Color.green)
                        Image(systemName: "magnifyingglass")
                            .imageScale(.large)
                            .foregroundColor(.white)
                    }
                })
            }
            .padding(.horizontal)
            
            if postVM.postTitle.isEmpty && postVM.postBody.isEmpty {
                Spacer()
                RedactedHomeView()
                    .frame(width: 270, height: 200)
                Text("No Posts Yet")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                Spacer()
            }
            else {
                ScrollView {
                    PostView()
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                }
            }
        }
        .onAppear() {
            PostVM.shared.fetchPostDataFromFirestore()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
