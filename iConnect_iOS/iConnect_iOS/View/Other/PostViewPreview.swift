//
//  PostViewPreview.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-04-11.
//

import SwiftUI

struct PostViewPreview: View {
    
    @State var previewName: String
    @State var previewTitle: String
    @State var previewBody: String
    @Binding var showPostPreview: Bool
    
    private let dateFormatter = NewPostVM.shared.dateFormatter
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 35, height: 35)
                VStack(alignment: .leading) {
                    Text("\(PostVM.shared.username)")
                        .font(.headline)
                    Text("Posted on \(dateFormatter.string(from: Date()))")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        showPostPreview = false
                    }
                }, label: {
                    Image(systemName: "multiply.circle")
                        .imageScale(.large)
                        .foregroundColor(.red)
                })
                
            }
            Divider()
            
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    if !NewPostVM.shared.postTitle.isEmpty {
                        Text(previewTitle)
                            .font(.system(size: 20, weight: .heavy))
                    }
                    
                    Text(previewBody)
                        .lineLimit(5)
                        .font(.subheadline)
                }
                
                Spacer()
            }
            
            Divider()
            
            HStack(alignment: .firstTextBaseline,spacing: 25) {
                Image(systemName: "heart")
                    .imageScale(.large)
                    .foregroundColor(.primary)
                
                Image(systemName: "text.bubble")
                    .imageScale(.large)
                    .foregroundColor(.primary)
                
                Image(systemName: "square.and.arrow.up")
                    .imageScale(.large)
                    .foregroundColor(.primary)
                
                Spacer()
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.secondary)
                .shadow(color: .gray, radius: 5)
        )
        .frame(width: UIScreen.main.bounds.width - 50)
    }
}
