//
//  DetailRegistration.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-05-28.
//

import SwiftUI

struct DetailInfo: View {
    
    @ObservedObject var viewModel = RegisterVM.shared
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            VStack {
                LogoView(imageName: "person.fill", imageSize: 100, displayColor: .blue)
                
                CustomEmptyView(width: nil, height: 5, foregroundColor: .clear)
                
                Text("Other Information")
                    .font(.title)
                    .bold()
                
                Text(viewModel.genderPickerMessage)
                    .lineLimit(20)
                    .padding()
                    .foregroundColor(.secondary)
                    .frame(height: 100)
                
                GroupBox {
                    DatePicker("Date of Birth", selection: $viewModel.dateOfBirth, displayedComponents: .date)
                    HStack {
                        Picker(selection: $viewModel.genderPicker, label: Text("Select Your Gender"), content: {
                            Text("Female").tag(0)
                            Text("Male").tag(1)
                            Text("Prefer not to say").tag(2)
                        })
                        .pickerStyle(MenuPickerStyle())
                        Spacer()
                    }
                }
                .cornerRadius(25)
                .padding()
                
                NavigationLink(destination: AccountSetup()) {
                    Text("Continue")
                        .font(.system(size: 20, weight: .semibold, design: .default))
                        .foregroundColor(.white)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).frame(width: 200, height: 50))
                }
                .simultaneousGesture(TapGesture().onEnded {
                    viewModel.updateBasicInfo(dob: viewModel.dateOfBirth, gender: viewModel.genderPicker)
                })
            }
            .padding(.bottom)
        }
    }
}

struct DiagnosticPreferences: View {
    
    @ObservedObject var viewModel = RegisterVM.shared
    
    let diagnosticPreferencesMsg = "If you want to help us improve iConnect, you can share diagnostic data with us. These data are for diagnostic and fixing errors.\n\nYour information like email, your name or posts you've shared on iConnect will never be included in these reports."
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                LogoView(imageName: "gear", imageSize: 100, displayColor: .blue)
                
                CustomEmptyView(width: nil, height: 5, foregroundColor: .clear)
                
                Text("Diagnostic Preferences")
                    .font(.title)
                    .bold()
                
                Text(diagnosticPreferencesMsg)
                    .lineLimit(10)
                    .padding()
                    .foregroundColor(.secondary)
                    .frame(height: 190)
                
                GroupBox {
                    Toggle(isOn: $viewModel.allowDiagnostic, label: {
                        Text("Allow Diagnostic Sharing")
                    })
                    .toggleStyle(SwitchToggleStyle(tint: .accentColor))
                }
                .cornerRadius(25)
                .padding()
                
                NavigationLink(
                    destination: WelcomeScreen(),
                    label: {
                        Text("Continue")
                            .font(.system(size: 20, weight: .semibold, design: .default))
                            .foregroundColor(.white)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).frame(width: 200, height: 50))
                    })
                    .simultaneousGesture(TapGesture().onEnded {
                        viewModel.updateDiagnosticPreferences(allowDiagnostic: viewModel.allowDiagnostic)
                    })
            }
            .padding(.bottom)
        }
    }
}

struct DetailRegistration_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                DetailInfo()
            }
            
            NavigationView {
                AccountSetup()
            }
            
            NavigationView {
                DiagnosticPreferences()
            }
        }
        .previewDevice("iPhone 12")
    }
}
