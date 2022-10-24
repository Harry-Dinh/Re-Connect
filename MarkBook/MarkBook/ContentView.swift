//
//  ContentView.swift
//  MarkBook
//
//  Created by Harry Dinh on 2022-10-09.
//

import SwiftUI

struct ContentView: View {
    
    var gridItems: [Subject] = [
        Subject(id: UUID().uuidString, name: "MATH 1007-A", color: .cyan, progress: 84.4),
        Subject(id: UUID().uuidString, name: "COMP 1405-D", color: .blue, progress: 95.6),
        Subject(id: UUID().uuidString, name: "FILM 1101-A", color: .mint, progress: 96.8)
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(gridItems) { subject in
                    NavigationLink(destination: DetailedMarkView(subject: subject)) {
                        HStack {
                            VStack(alignment: .leading, spacing: 5) {
                                Text(subject.name)
                                    .font(.headline)
                                Text("Progress: ~\(Int(subject.progress))%")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("My Subjects")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "plus")
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Menu(content: {
                        Button(action: {}) {
                            Label("Select Items...", systemImage: "checkmark.circle")
                        }
                        
                        Button(action: {}) {
                            Label("Settings", systemImage: "gear")
                        }
                    }) {
                        Image(systemName: "ellipsis.circle")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
