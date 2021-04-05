//
//  EventScreen.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-04-05.
//

import SwiftUI

struct EventScreen: View {
    var body: some View {
        VStack {
            HStack {
                Text("events")
                    .font(.system(size: 36, weight: .heavy, design: .rounded))
                    .foregroundColor(.green)
                
                Spacer()
            }
            .padding(.horizontal)
            
            Spacer()
        }
    }
}

struct EventScreen_Previews: PreviewProvider {
    static var previews: some View {
        EventScreen()
    }
}
