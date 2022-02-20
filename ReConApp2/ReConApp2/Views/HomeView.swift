//
//  HomeView.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-02-20.
//

import SwiftUI

struct HomeView: View {
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    VStack(alignment: .leading) {
                        Text(dateFormatter.string(from: Date()).uppercased())
                            .font(.custom("Rubik", size: 13, relativeTo: .footnote))
                            .foregroundColor(.secondary)
                        Text("Re:Connect")
                            .font(.custom("Rubik Light SemiBold", size: 28, relativeTo: .title))
                    }
                    .padding(.top)
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "magnifyingglass")
                    }
                    .buttonStyle(.bordered)
                    .clipShape(Circle())
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
