//
//  Home.swift
//  iCList
//
//  Created by Harry Dinh on 2021-07-04.
//

import SwiftUI

struct Home: View {
    
    @ObservedObject var viewModel = HomeVM.shared
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: EmptyView()) {
                    CustomListLabel(icon: Image(systemName: "sun.max"), title: "Today", subtitle: "", backgroundColor: Color(.systemTeal))
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}, label: {
                        HStack {
                            Image(systemName: "person.crop.circle")
                            
                            
                            Text("iConnect List")
                        }
                        .font(.headline)
                    })
                    .foregroundColor(Color(.systemTeal))
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
