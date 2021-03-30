//
//  Home.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-18.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            HStack {
                Text("iconnect")
                    .font(.system(size: 36, weight: .heavy, design: .rounded))
                    .foregroundColor(.green)
                
                Spacer()
            }
            .padding(.horizontal)
            
            ScrollView {
                ForEach(0..<30, id: \.self) { _ in
                    PostView()
                        .padding()
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
