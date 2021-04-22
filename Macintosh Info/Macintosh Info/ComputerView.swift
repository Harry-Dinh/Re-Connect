//
//  ComputerView.swift
//  Macintosh Info
//
//  Created by Harry Dinh on 2021-04-18.
//

import SwiftUI

struct ComputerView: View {
    var body: some View {
        VStack {
            
            Image(systemName: "laptopcomputer")
                .font(.system(size: 200))
            
            GroupBox {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Name: ")
                            .bold()
                        
                        Text("Harry's MacBook Pro")
                    }
                    
                    HStack {
                        Text("Model: ")
                            .bold()
                        
                        Text("MacBook Pro (13-inch, 2020, Two Thunderbolt 3 ports)")
                    }
                    
                    HStack {
                        Text("OS Version: ")
                            .bold()
                        Text("macOS 11.2.3 Big Sur")
                    }
                    
                    HStack {
                        Text("OS Build Number: ")
                            .bold()
                        Text("20D91")
                    }
                    
                    HStack {
                        Text("Serial Number: ")
                            .bold()
                        Text("C02CN11AP3YX")
                    }
                }
                .padding()
            }
        }
        .padding()
        .navigationTitle("Computer")
    }
}

struct ComputerView_Previews: PreviewProvider {
    static var previews: some View {
        ComputerView()
    }
}
