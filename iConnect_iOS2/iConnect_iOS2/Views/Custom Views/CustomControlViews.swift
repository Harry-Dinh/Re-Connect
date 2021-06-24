//
//  CustomControlViews.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-06-23.
//

import SwiftUI

struct CustomControlTable: View {
    
    var actionTitle: String
    var tintColor: Color
    var icon: Image
    
    var body: some View {
        Button(action: {}, label: {
            HStack {
                Text(actionTitle)
                Spacer()
                icon
                    .imageScale(.large)
                    .frame(width: 30)
            }
        })
        .frame(height: 40)
        .foregroundColor(tintColor)
    }
}

struct CustomNavTitle: View {
    
    var title: String
    var summaryLine: String?
    var icon: Image
    var iconTint: Color
    var iconBackgroundTint: Color
    var secondaryInfo: Bool
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 7)
                    .frame(width: 35, height: 35)
                    .foregroundColor(iconBackgroundTint)
                
                icon
                    .foregroundColor(iconTint)
                    .font(.system(size: 23))
            }
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                
                if secondaryInfo {
                    Text(summaryLine ?? "No Information Available")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

struct CustomControlPreviews: PreviewProvider {
    static var previews: some View {
        Group {
            CustomControlTable(actionTitle: "Star Trek", tintColor: .red, icon: Image(systemName: "star"))
            CustomNavTitle(title: "Home Settings", summaryLine: "Quick settings to customize your Home screen", icon: Image(systemName: "gear"), iconTint: .white, iconBackgroundTint: .secondary, secondaryInfo: true)
                .preferredColorScheme(.dark)
        }
    }
}
