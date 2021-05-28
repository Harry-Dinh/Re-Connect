//
//  Home.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-05-02.
//

import SwiftUI

struct Home: View {
    
    @ObservedObject var newPostVM = NewPostVM.shared
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("iconnect")
                    .font(Font.custom("Oxanium", size: 30))
                    .foregroundColor(Color("iconnectBlue"))
                    .fontWeight(.heavy)
                
                Spacer()
                
                Button(action: {
                    newPostVM.showNewPost.toggle()
                }, label: {
                    ZStack {
                        Capsule()
                            .foregroundColor(Color(.systemGray5))
                        
                        Image(systemName: "plus")
                            .font(.system(size: 20))
                    }
                    .frame(width: 30, height: 30)
                })
                .fullScreenCover(isPresented: $newPostVM.showNewPost, content: {
                    NewPostScreen()
                })
            }
            .padding(.horizontal)
            .padding(.bottom, 7)
            
            Divider()
            
            Spacer()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
