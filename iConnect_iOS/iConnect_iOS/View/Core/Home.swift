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
            
            ScrollView {
                ForEach(0..<10, id: \.self) { _ in
                    PostView()
                        .padding()
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
