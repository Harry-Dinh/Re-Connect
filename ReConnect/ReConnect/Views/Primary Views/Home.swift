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
            ForEach(1..<100) { _ in
                Text("W O O M Y")
            }
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
