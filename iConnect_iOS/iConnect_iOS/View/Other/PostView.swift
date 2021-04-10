//
//  PostView.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-26.
//

import SwiftUI

struct PostView: View {
    
    @ObservedObject var viewModel = PostVM.shared
    @State var postModel: PostModel
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 35, height: 35)
                    VStack(alignment: .leading) {
                        Text("\(viewModel.username)")
                            .font(.headline)
                        Text("Posted on \(postModel.date)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    Menu {
                        Button(action: {
                            
                        }, label: {
                            Label("Delete Post", systemImage: "trash")
                                .border(Color.red)
                        })
                        
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
                
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        if !postModel.title.isEmpty {
                            Text("\(postModel.title)")
                                .font(.system(size: 20, weight: .heavy))
                        }
                        
                        Text("\(postModel.body)")
                            .lineLimit(5)
                            .font(.subheadline)
                    }
                    
                    Spacer()
                }
                
                Divider()
                
                HStack(alignment: .firstTextBaseline,spacing: 25) {
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "heart")
                            .imageScale(.large)
                            .foregroundColor(.primary)
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
                    .stroke(Color.secondary)
                    .shadow(color: .gray, radius: 5)
            )
        }
    }
}

struct PostPreview: PreviewProvider {
    static var previews: some View {
        PostView(postModel: PostModel(title: "", body: "", date: "", liked: false))
    }
}
