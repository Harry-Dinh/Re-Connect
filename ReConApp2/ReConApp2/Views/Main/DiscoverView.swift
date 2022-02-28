//
//  DiscoverView.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-02-27.
//

import SwiftUI

struct DiscoverView: View {
    var body: some View {
        NavigationView {
            List {
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: .constant(""))
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Discover")
                        .font(.custom("Rubik Light SemiBold", size: 28, relativeTo: .title))
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "qrcode")
                    }
                }
            }
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
