//
//  AboutThisAppView.swift
//  ReDo
//
//  Created by Harry Dinh on 2023-02-25.
//

import SwiftUI

struct AboutThisAppView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "app.fill")
                    .font(.system(size: 120))
                    .foregroundColor(.accentColor)
                
                VStack(alignment: .leading) {
                    Text("Re:Tasks")
                        .font(.largeTitle)
                    Text("By Re:Connect")
                        .foregroundColor(.secondary)
                }
                
                CustomEmptyView(height: 150, width: 30)
                
                GroupBox {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("Version:")
                            Text("1.0 (beta)")
                                .foregroundColor(.secondary)
                                .font(.system(.body, design: .monospaced))
                        }
                        
                        HStack {
                            Text("Build number:")
                            Text("230702251459")
                                .foregroundColor(.secondary)
                                .font(.system(.body, design: .monospaced))
                        }
                    }
                    .padding()
                }
            }
            
            Text("Copyright 2023 Re:Connect Inc. All rights reserved.")
                .foregroundColor(.secondary)
        }
        .padding()
        .fixedSize()
    }
}

struct AboutThisAppView_Previews: PreviewProvider {
    static var previews: some View {
        AboutThisAppView()
    }
}
