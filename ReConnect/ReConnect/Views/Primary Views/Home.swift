//
//  Home.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-23.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ScrollView {
            Text("There is nothing here... yet.")
                .font(.title)
                .foregroundColor(.secondary)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Text("Re:Connect")
                    .font(.title)
                    .bold()
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Menu {
                    Button(action: {}, label: {
                        Label("New Post", systemImage: "plus.circle")
                    })
                    
                    Button(action: {}, label: {
                        Label("New Story", systemImage: "plus.rectangle.portrait")
                    })
                } label: {
                    Image(systemName: "plus")
                        .imageScale(.large)
                }

            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Home()
        }
    }
}
