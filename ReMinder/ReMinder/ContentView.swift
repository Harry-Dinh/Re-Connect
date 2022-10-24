//
//  ContentView.swift
//  ReMinder
//
//  Created by Harry Dinh on 2022-09-22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var objManager = ObjectManager.current
    
    @State private var showCreateListView = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(destination: ListDetailedView(listItem: objManager.systemLists[0])) {
                        Label("Inbox", systemImage: "tray")
                    }
                }
                
                Section {
                    NavigationLink(destination: ListDetailedView(listItem: objManager.systemLists[1])) {
                        Label("Today", systemImage: "clock")
                            .tint(.yellow)
                    }
                    
                    NavigationLink(destination: ListDetailedView(listItem: objManager.systemLists[2])) {
                        Label("Upcoming", systemImage: "calendar")
                            .tint(.red)
                    }
                    
                    NavigationLink(destination: ListDetailedView(listItem: objManager.systemLists[3])) {
                        Label("Deadline", systemImage: "flag")
                            .tint(.red)
                    }
                }
                
                Section {
                    ForEach(objManager.lists) { list in
                        NavigationLink(destination: ListDetailedView(listItem: list)) {
                            Label {
                                Text(list.icon)
                            } icon: {
                                Text(list.name)
                            }
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    
                    Menu {
                        Button(action: {
                            showCreateListView.toggle()
                        }, label: { Label("New List", systemImage: "plus.circle") })
                        Button(action: {}, label: { Label("New Task", systemImage: "plus") })
                    } label: {
                        Image(systemName: "plus")
                    }
                    .menuStyle(.button)
                    .buttonStyle(.borderedProminent)
                    .clipShape(Circle())
                    .sheet(isPresented: $showCreateListView) {
                        CreateListView()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
