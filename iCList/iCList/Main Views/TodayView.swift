//
//  TodayView.swift
//  iCList
//
//  Created by Harry Dinh on 2021-07-04.
//

import SwiftUI

struct TodayView: View {
    var body: some View {
        List {
            
        }
        .navigationTitle("Today")
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Menu {
                    Section {
                        Label("Check All Tasks", systemImage: "checkmark.circle")
                        Label("Uncheck All Tasks", systemImage: "xmark.circle")
                    }
                    
                    Section {
                        Label("Edit", systemImage: "pencil")
                        Label("Sort", systemImage: "arrow.up.arrow.down")
                        Label("Delete List", systemImage: "trash")
                        Label("Show Completed", systemImage: "eye")
                    }
                    
                    Section {
                        Label("Print List", systemImage: "printer")
                        Label("Export as PDF", systemImage: "doc")
                    }
                } label: {
                    Image(systemName: "ellipsis.circle")
                }

                
                Button(action: {}, label: {
                    Image(systemName: "plus.circle.fill")
                })
            }
        }
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TodayView()
        }
    }
}
