//
//  Home.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-23.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "heart.text.square.fill")
                .font(.system(size: 100))
                .foregroundColor(.secondary)
            
            Text("There is nothing here... yet.")
                .font(.title)
                .foregroundColor(.secondary)
        }
        .navigationTitle("Re:Connect")
        .toolbar {
            
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
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Home()
        }
    }
}
