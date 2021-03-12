//
//  Home.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-09.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    PostView()
                        .padding()
                }
            }
            .navigationBarTitle("Home")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
