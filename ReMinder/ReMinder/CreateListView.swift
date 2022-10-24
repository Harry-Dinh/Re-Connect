//
//  CreateListView.swift
//  ReMinder
//
//  Created by Harry Dinh on 2022-10-21.
//

import Combine
import SwiftUI

struct CreateListView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject var objManager = ObjectManager.current
    
    @State private var listName = ""
    @State private var listIcon = "📌"
    @State private var listColor = Color.accentColor
    
    @State private var selectedTab = 0
    
    let circleDiameter: CGFloat = 130
    let textLimit = 1
    let emojisArray = ["📌", "🧭", "💻", "📅", "💼"]
    let screenW = UIScreen().bounds.width
    let screenH = UIScreen().bounds.height
    
    private func limitText(_ limit: Int) {
        if listIcon.count > limit {
            listIcon = String(listIcon.prefix(limit))
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    HStack {
                        Spacer()
                        ZStack {
                            if colorScheme == .light {
                                Circle()
                                    .fill(listColor.gradient)
                                    .frame(width: circleDiameter, height: circleDiameter)
                                    .shadow(color: listColor, radius: 5, x: 0, y: 3)
                            }
                            else {
                                Circle()
                                    .fill(listColor.gradient)
                                    .frame(width: 130, height: 130)
                                    .shadow(color: listColor, radius: 0, x: 0, y: 3)
                            }
                            
                            TextField("", text: $listIcon)
                                .font(.system(size: circleDiameter - 50, weight: .semibold, design: .rounded))
                                .multilineTextAlignment(.center)
                                .onReceive(Just(listIcon)) { _ in
                                    limitText(textLimit)
                                }
                            
                        }
                        Spacer()
                    }
                    .listRowBackground(Color.clear)
                }
                
                Section {
                    TextField("Name", text: $listName)
                        .padding(7)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                }
            }
            .navigationTitle("Create New Task")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") { dismiss.callAsFunction() }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Create") {
                        let listItem = ListItem(id: UUID().uuidString, name: listName, icon: listIcon, tasks: [])
                        objManager.lists.append(listItem)
                        
                        dismiss.callAsFunction()
                    }
                }
            }
        }
        .interactiveDismissDisabled()
    }
}

struct CreateListView_Previews: PreviewProvider {
    static var previews: some View {
        CreateListView()
    }
}
