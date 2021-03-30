//
//  PostView.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-26.
//

import SwiftUI

struct PostView: View {
    
    @ObservedObject var viewModel = PostVM.shared
    
    var postModel = PostModel.shared
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 35, height: 35)
                VStack(alignment: .leading) {
                    Text("Harry Dinh")
                        .font(.headline)
                    Text("Posted on \(postModel.date)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Menu {
                    Button(action: {}, label: {
                        Label("Report", systemImage: "exclamationmark.triangle")
                    })
                } label: {
                    Image(systemName: "ellipsis.circle")
                        .imageScale(.large)
                        .foregroundColor(.primary)
                }

            }
            Divider()
            
            NavigationLink(
                destination: DetailPostView(),
                label: {
                    Text("\(postModel.body)")
                        .lineLimit(5)
                        .foregroundColor(.primary)
                })
            
            Divider()
            
            HStack(alignment: .firstTextBaseline,spacing: 25) {
                Button(action: {
                    viewModel.postLiked.toggle()
                }, label: {
                    Image(systemName: viewModel.postLiked ? "heart.fill" : "heart")
                        .imageScale(.large)
                        .foregroundColor(viewModel.postLiked ? .pink : .primary)
                })
                
                Button(action: {}, label: {
                    Image(systemName: "text.bubble")
                        .imageScale(.large)
                        .foregroundColor(.primary)
                })
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "square.and.arrow.up")
                        .imageScale(.large)
                        .foregroundColor(.primary)
                })
                
                Spacer()
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.primary)
                .shadow(color: .gray, radius: 5)
        )
    }
}
