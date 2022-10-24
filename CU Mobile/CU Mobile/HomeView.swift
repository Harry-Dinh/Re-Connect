//
//  HomeView.swift
//  CU Mobile
//
//  Created by Harry Dinh on 2022-10-20.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            List {
                Section {
                    Picker("Picker", selection: .constant(0)) {
                        Text("Recent News").tag(0)
                        Text("Upcoming Events").tag(1)
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    ForEach(0..<5) { _ in 
                        HStack {
                            Image(systemName: "newspaper")
                                .font(.system(size: 40))
                                .foregroundColor(.accentColor)
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text("News Headline")
                                    .font(.headline)
                                Text("News subheadline")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Carleton University")
            .toolbar {
                Menu(content: {
                    Button(action: {}) {
                        Label("View Profile", systemImage: "person.crop.circle")
                    }
                    
                    Button(role: .destructive, action: {}) {
                        Label("Sign Out...", systemImage: "rectangle.portrait.and.arrow.right")
                    }
                }) {
                    Image(systemName: "person.crop.circle")
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
