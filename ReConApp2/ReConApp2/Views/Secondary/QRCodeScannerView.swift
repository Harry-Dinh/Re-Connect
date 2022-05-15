//
//  QRCodeScannerView.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-05-15.
//

import SwiftUI

struct QRCodeScannerView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack(spacing: 5) {
                        Image(systemName: "qrcode.viewfinder")
                            .font(.system(size: 70))
                            .foregroundColor(.accentColor)
                            .symbolRenderingMode(.hierarchical)
                        
                        HStack {
                            Spacer()
                            Text("One-Tap-Follow")
                                .font(.title)
                                .bold()
                            Spacer()
                        }
                    }
                    
                    CustomEmptyView(width: nil, height: 30, color: .clear)
                    
                    VStack(spacing: 40) {
                        CustomLabelView(icon: "camera.viewfinder", title: "Scan and Go", subtitle: "Just tap \"Scan Code\" below and scan for your friend's code", color: .accentColor)
                        
                        CustomLabelView(icon: "person.2", title: "Easy and Innovative", subtitle: "When you scan your friend's code, their account will follow you and vise versa. No need to scan the second time.", color: .accentColor)
                    }
                    .padding()
                }
                .navigationBarTitleDisplayMode(.inline)
                
                VStack(spacing: 10) {
                    Spacer()
                    
                    Button(action: {}) {
                        Text("Scan Code")
                            .fontWeight(.semibold)
                            .frame(maxWidth: 285)
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Button(action: {}) {
                        Text("Display My Code")
                            .fontWeight(.semibold)
                            .frame(maxWidth: 285)
                    }
                    .buttonStyle(.bordered)
                }
                .controlSize(.large)
                .padding(.bottom)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Done") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
        .interactiveDismissDisabled()
    }
}

struct QRCodeScannerView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeScannerView()
    }
}
