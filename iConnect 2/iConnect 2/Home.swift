//
//  Home.swift
//  iConnect 2
//
//  Created by Harry Dinh on 2021-03-09.
//

import SwiftUI

struct Home: View {
    var body: some View {
        Text("Welcome Home")
            .padding()
            .toolbar(content: {
                ToolbarItem {
                    Button(action: {}, label: {
                        Image(systemName: "square.and.pencil")
                            .imageScale(.large)
                    })
                }
            })
            .navigationTitle("Home")
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
