//
//  SettingsGeneralView.swift
//  ReDo
//
//  Created by Harry Dinh on 2023-02-24.
//

import SwiftUI

struct SettingsGeneralView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Data Syncing")
                .bold()
            Group {
                Toggle(isOn: .constant(true)) {
                    VStack(alignment: .leading) {
                        Text("Enable syncing")
                        Text("Allow syncing via Apple iCloud or Re:Connect UltraSync®")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                
                Picker("Sync lists and tasks using:", selection: .constant(0)) {
                    Text("UltraSync").tag(0)
                    Text("iCloud").tag(1)
                }
            }
            .padding(.leading)
            
            Divider()
            
            Text("User Interface")
                .bold()
            
            Group {
                Picker("App appearance:", selection: .constant(0)) {
                    Text("System Settings").tag(0)
                    Text("Light").tag(1)
                    Text("Dark").tag(2)
                }
                
                GroupBox {
                    VStack(spacing: 10) {
                        Picker("New task creation screen:", selection: .constant(0)) {
                            Text("Window").tag(0)
                            Text("Sheet").tag(1)
                        }
                        
                        Picker("New list creation screen:", selection: .constant(1)) {
                            Text("Window").tag(0)
                            Text("Sheet").tag(1)
                        }
                    }
                    .padding()
                } label: {
                    Text("Controls Presentation Style")
                }
            }
            .padding(.leading)
        }
        .padding()
        .frame(width: 500, height: 330)
    }
}

struct SettingsGeneralView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsGeneralView()
            .padding()
    }
}
