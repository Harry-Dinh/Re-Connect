//
//  Home.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-05-02.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("iconnect")
                    .font(Font.custom("Oxanium", size: 36))
                    .foregroundColor(Color("iconnectBlue"))
                    .fontWeight(.heavy)
                
                Spacer()
                
                Button(action: {}, label: {
                    ZStack {
                        Circle()
                            .foregroundColor(Color(.systemGray5))
                        
                        Image(systemName: "plus")
                    }
                    .frame(width: 30, height: 30)
                })
            }
            .padding()
            
            CustomEmptyView(width: nil, height: 1, foregroundColor: Color(.systemGray4))
            
            Spacer()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
