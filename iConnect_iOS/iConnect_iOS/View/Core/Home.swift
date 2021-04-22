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
                            .foregroundColor(Color(.systemGray5))
                        Image(systemName: "square.and.pencil")
                            .imageScale(.large)
                            .foregroundColor(.green)
                    }
                })
                .fullScreenCover(isPresented: $model.showNewPostScreen, content: {
                    NavigationView {
                        NewPostScreen()
                    }
                })
            }
            .padding(.horizontal)
            
            if postVM.postModel.count == 0 {
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
                    ForEach(postVM.postModel, id: \.id) { post in
                        PostView(postModel: PostModel(title: post.title, body: post.body, date: post.date, liked: post.liked))
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                    }
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
