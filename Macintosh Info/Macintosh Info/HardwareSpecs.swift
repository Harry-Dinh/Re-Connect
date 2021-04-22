//
//  HardwareSpecs.swift
//  Macintosh Info
//
//  Created by Harry Dinh on 2021-04-18.
//

import SwiftUI

struct HardwareSpecs: View {
    var body: some View {
        VStack(spacing: 20) {
            
            Image(systemName: "cpu")
                .font(.system(size: 200))
                .foregroundColor(Color(.systemBlue))
            
            GroupBox(label: Text("Processor & Graphics")) {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Processor: ")
                            .bold()
                        Text("Intel Core i5")
                    }
                    
                    HStack {
                        Text("Base Frequency: ")
                            .bold()
                        Text("1.4 GHz")
                    }
                    
                    HStack {
                        Text("Number of Cores: ")
                            .bold()
                        Text("4")
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Graphics: ")
                            .bold()
                        Text("Intel Iris Plus Graphics 645")
                    }
                    
                    HStack {
                        Text("Cache Memory: ")
                            .bold()
                        
                        Text("1536 MB")
                    }
                }
                .padding()
            }
            
            GroupBox(label: Text("Memory (RAM)"), content: {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Total Memory: ")
                            .bold()
                        Text("16 GB")
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Using: ")
                            .bold()
                        Text("6.51 GB (26%)")
                    }
                    
                    HStack {
                        Text("Memory Type: ")
                            .bold()
                        Text("LPDDR3")
                    }
                    
                    HStack {
                        Text("Manufacturer: ")
                            .bold()
                        Text("Samsung")
                    }
                }
                .padding()
            })
        }
        .padding()
        .navigationTitle("Hardware Specs")
    }
}

struct HardwareSpecs_Previews: PreviewProvider {
    static var previews: some View {
        HardwareSpecs()
    }
}
