//
//  RECSubscriberIndicator.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-27.
//

import SwiftUI

struct RECSubscriberIndicator: View {
    
    enum SubscriberType {
        case following
        case follower
    }
    
    var subscriberCount: Int
    var subscriberType: SubscriberType
    
    var body: some View {
        GroupBox {
            Text("\(subscriberCount)")
                .font(.system(.largeTitle, design: .rounded, weight: .bold))
                .padding(7)
        } label: {
            if subscriberType == .follower {
                Text("followers".uppercased())
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            } else {
                Text("following".uppercased())
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .cornerRadius(15)
    }
}

struct RECSubscriberIndicator_Previews: PreviewProvider {
    static var previews: some View {
        RECSubscriberIndicator(subscriberCount: 0, subscriberType: .follower)
    }
}
