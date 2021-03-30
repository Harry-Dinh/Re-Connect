//
//  PostView.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-26.
//

import SwiftUI

struct PostView: View {
    
    @ObservedObject var model = PostVM.shared
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 35, height: 35)
                VStack(alignment: .leading) {
                    Text("Harry Dinh")
                        .font(.headline)
                    Text("Posted on Mar 26, 2021 at 16:00")
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
                    Text("That is the only thing he said to the group of four. Jeni was confused of what he meant by 'fogged', she asks some of her teammates but none of them answered to her, they’re all focused on their task at hand, getting sixty Power Eggs. It was only a matter of time for Jeni to find out what Mr. Grizz meant. Everybody squid-jumped to a high area of Spawning Ground, the place is nothing more than a large chunk of rock with rusted metal scaffoldings built on top of it. Launching toward their position is a large basket, it is for storing the eggs and with a large metal grill surrounding it, it’s clearly that Mr. Grizz doesn’t want the Salmonids to take them back. Right now, one of the teammates walk over to Jeni and explain to her the situation, ''fogged' is meant for foggy waves as the environment will be covered with a dense cloud of fog which will make it very hard to navigate around and spotting enemies. The Boss Salmonids can be really easy to recognize in any conditions because they’re always have that yellow glow like a gold bar. Jeni thanked him and both of them get back to their positions to prepare for the first wave of battle.")
                        .lineLimit(5)
                        .foregroundColor(.primary)
                })
            
            Divider()
            
            HStack(alignment: .firstTextBaseline,spacing: 25) {
                Button(action: {
                    model.postLiked.toggle()
                }, label: {
                    Image(systemName: model.postLiked ? "heart.fill" : "heart")
                        .imageScale(.large)
                        .foregroundColor(model.postLiked ? .pink : .primary)
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

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
