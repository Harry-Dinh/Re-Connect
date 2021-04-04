//
//  Home.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-18.
//

import SwiftUI

struct Home: View {
    
    @ObservedObject var model = HomeVM.shared
    
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
                            .foregroundColor(Color.black.opacity(0.15))
                        Image(systemName: "plus")
                            .imageScale(.large)
                            .foregroundColor(.green)
                    }
                })
                .sheet(isPresented: $model.showNewPostScreen, content: {
                    NavigationView {
                        NewPostScreen()
                    }
                })
                
                Button(action: {}, label: {
                    ZStack {
                        Circle()
                            .frame(width: 35, height: 35)
                            .foregroundColor(Color.black.opacity(0.15))
                        Image(systemName: "magnifyingglass")
                            .imageScale(.large)
                            .foregroundColor(.green)
                    }
                })
            }
            .padding(.horizontal)
            
            ScrollView {
                ForEach(0..<30, id: \.self) { _ in
                    PostView()
                        .padding()
                }
            }
        }
        .onAppear {
            DatabaseManager.shared.downloadUserPostData()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
