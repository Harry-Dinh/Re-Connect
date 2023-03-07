//
//  ContentView.swift
//  Build Number Generator
//
//  Created by Harry Dinh on 2023-03-07.
//

import SwiftUI

struct ContentView: View {
    
    @State private var date: Date = Date.now
    
    @State private var buildNumber = "93581"
    
    private let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        return formatter
    }()
    
    private func generateNewNumber() -> String {
        var buildNumStr = "93581"
        
        let components = date.get(.day, .month, .year)
        if let day = components.day, let month = components.month, let year = components.year {
            var dayStr = ""
            var monthStr = ""
            var yearStr = String(year)
            
            if day < 10 {
                dayStr = "0\(day)"
            } else {
                dayStr = "\(day)"
            }
            
            if month < 10 {
                monthStr = "0\(day)"
            } else {
                monthStr = "\(day)"
            }
            
            buildNumStr = "\(yearStr)\(monthStr)\(dayStr)"
        }
        return buildNumStr
    }
    
    var body: some View {
        VStack {
            Label {
                Text(date, formatter: formatter)
                    .foregroundColor(.secondary)
            } icon: {
                Text("Current time:")
            }
            
            GroupBox {
                Text(buildNumber)
                    .padding()
                    .font(.system(.title, design: .monospaced))
                    .frame(width: 300)
                    .contextMenu {
                        Button("Copy to Clipboard") {
                            // Copy to clipboard action
                        }
                    }
            } label: {
                Text("Build Number")
            }
            
            Spacer()
            
            HStack {
                Spacer()
                Button("Update Time") {
                    date = Date.now
                }
                
                Button("Generate Build Number") {
                    buildNumber = generateNewNumber()
                }
                .keyboardShortcut(.defaultAction)
            }
        }
        .padding()
        .frame(width: 350, height: 200)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
