//
//  General.swift
//  iConnect 2
//
//  Created by Harry Dinh on 2021-03-09.
//

import SwiftUI
import Cocoa

struct General: View {
    
    @AppStorage("selected_appearance") var selectedAppearance = 0
    @AppStorage("appearance_boolean") var appearanceBoolean = false
    
    @AppStorage("download_location") var downloadLocation = 0
    
    var body: some View {
        VStack {
            Picker(selection: $selectedAppearance, label: Text("Appearance: "), content: {
                Text("System").tag(0)
                Text("Light").tag(1)
                Text("Dark").tag(2)
            })
            .frame(width: 200)
            
            CustomEmptyView(width: 500, height: 15, color: .clear)
            
//            GroupBox(label: Text("Post & Story Privacy"), content: {
//                VStack(spacing: 20) {
//
//                    Picker(selection: $selectedPostPrivacy, label: Text("Posts will be visible to... "), content: {
//                        Text("No One").tag(0)
//                        Text("Followers Only").tag(1)
//                        Text("Public").tag(3)
//                    })
//                    .frame(width: 450)
//
//                    Picker(selection: $selectedStoryPrivacy, label: Text("Stories will be visible to... "), content: {
//                        Text("No One").tag(0)
//                        Text("Followers Only").tag(1)
//                        Text("Public").tag(3)
//                    })
//                    .frame(width: 450)
//                }
//            })
            
            Picker(selection: $downloadLocation, label: Text("Download location: "), content: {
                Text("Downloads Folder").tag(0)
                Text("Documents Folder").tag(1)
                Text("Desktop").tag(2)
            })
            .frame(width: 300)
        }
        .padding()
    }
    
//    func overrideDarkMode(isDark: Bool) {
//        let window = NSApplication.shared.windows.first
//        window?.appearance = NSAppearance(appearanceNamed: isDark ? .aqua : .darkAqua, bundle: nil)
//    }
}

struct General_Previews: PreviewProvider {
    static var previews: some View {
        General()
    }
}
