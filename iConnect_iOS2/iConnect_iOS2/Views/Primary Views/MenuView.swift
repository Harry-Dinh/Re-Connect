//
//  MenuView.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-07-14.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                GroupBox(label: Text("iConnect").foregroundColor(.secondary)) {
                    CustomTableRow(icon: "message.fill", title: "iConnect Chat", backgroundColor: .green)
                    
                    CustomTableRow(icon: "play.fill", title: "iConnect Shorts", backgroundColor: .pink)
                    
                    CustomTableRow(icon: "cart.fill", title: "Mobie Market", backgroundColor: .blue)
                }
                .cornerRadius(20)
                
                GroupBox(label: HStack {
                    Text("My Collections")
                        .foregroundColor(.secondary)
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "folder.badge.plus")
                    })
                }) {
                    CustomTableRow(icon: "bookmark.fill", title: "Saved Items", backgroundColor: .pink)
                    
                    CustomTableRow(icon: "person.2.fill", title: "Shared Items", backgroundColor: .green)
                }
                .cornerRadius(20)
                
                GroupBox(label: Text("Others").foregroundColor(.secondary), content: {
                    NavigationLink(destination: Settings()) {
                        CustomTableRow(icon: "gearshape.fill", title: "Settings", backgroundColor: .gray)
                    }
                    
                    NavigationLink(destination: EmptyView()) {
                        CustomTableRow(icon: "exclamationmark.bubble.fill", title: "Send a Feedback", backgroundColor: .gray)
                    }
                    
                    NavigationLink(destination: EmptyView()) {
                        CustomTableRow(icon: "questionmark.circle.fill", title: "Get Help", backgroundColor: .gray)
                    }
                })
                .cornerRadius(20)
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Text("Menu")
                    .font(.title)
                    .bold()
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MenuView()
        }
    }
}
