//
//  RedactedHomeView.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-04-09.
//

import SwiftUI

struct RedactedHomeView: View {
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 35, height: 35)
                    VStack(alignment: .leading) {
                        Text("Rick Astley")
                            .font(.headline)
                        Text("Posted on Apr 9, 2021 at 13:41")
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
                
                HStack {
                    VStack(alignment: .leading) {
                            Text("You've been Rickrolled")
                                .font(.system(size: 20, weight: .heavy))
                        
                        Text("Never gonna give you up, never gonna let you down. never gonna run around and dessert you.")
                            .lineLimit(5)
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
        .redacted(reason: .placeholder)
    }
}

struct RedactedHomeView_Previews: PreviewProvider {
    static var previews: some View {
        RedactedHomeView()
    }
}
