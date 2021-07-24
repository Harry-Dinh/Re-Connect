//
//  CustomGroupBox.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-24.
//

import SwiftUI

struct CustomGroupBox<Title: View, Content: View>: View {
    
    var titleView: Title
    var contentView: Content
    
    @Environment(\.colorScheme) var colorScheme
    
    init(@ViewBuilder titleView: @escaping () -> Title, @ViewBuilder contentView: @escaping () -> Content) {
        self.contentView = contentView()
        self.titleView = titleView()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            titleView
                .font(.caption)
                .foregroundColor(.secondary)
                .lineLimit(1)
                .frame(height: 38)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
            
            VStack {
                contentView
                    .padding(.top)
                    .padding([.bottom, .horizontal])
                    .frame(maxWidth: .infinity)
            }
        }
        .background(colorScheme == .light ? Color(.systemGray6).cornerRadius(15) : Color(.systemGray5).cornerRadius(15))
    }
}

struct CustomCorner: Shape {
    
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}

struct CustomGroupBox_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            CustomGroupBox {
                EmptyView()
            } contentView: {
                VStack(spacing: 6) {
                    Text("25")
                        .font(.system(size: 35, weight: .regular, design: .rounded))
                    
                    Text("Followers")
                }
            }
            
            CustomGroupBox {
                EmptyView()
            } contentView: {
                VStack(spacing: 6) {
                    Text("19")
                        .font(.system(size: 35, weight: .regular, design: .rounded))
                    
                    Text("Following")
                }
            }
        }
        .preferredColorScheme(.dark)
        .padding()
    }
}
