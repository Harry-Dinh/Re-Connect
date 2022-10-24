//
//  DetailedMarkView.swift
//  MarkBook
//
//  Created by Harry Dinh on 2022-10-20.
//

import SwiftUI

struct DetailedMarkView: View {
    
    var subject: Subject
    
    var body: some View {
        List {
            Section {
                HStack(spacing: 20) {
                    Gauge(value: subject.progress, in: 0...100) {
                        Text("\(Int(subject.progress))%")
                    }
                    .gaugeStyle(.accessoryCircularCapacity)
                    .tint(subject.color)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Summary")
                            .font(.headline)
                        
                        Text("Overall Mark: \(subject.progress, format: .number)%")
                    }
                }
            }
            
            Section("Mark Entries") {
                
            }
        }
        .navigationTitle(subject.name)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Menu {
                    Button(action: {}) {
                        Label("Select Items...", systemImage: "checkmark.circle")
                    }
                    
                    Divider()
                    
                    Button(action: {}) {
                        Label("Edit Subject...", systemImage: "pencil")
                    }
                    
                    Button(role: .destructive, action: {}) {
                        Label("Delete...", systemImage: "trash")
                    }
                    
                    Button(action: {}) {
                        Label("Print...", systemImage: "printer")
                    }
                } label: {
                    Image(systemName: "ellipsis.circle")
                }
            }
            
            ToolbarItemGroup(placement: .bottomBar) {
                HStack {
                    Button("New Mark Entry...") {}
                    
                    Spacer()
                }
            }
        }
    }
}

struct DetailedMarkView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailedMarkView(subject: Subject.example)
        }
    }
}
