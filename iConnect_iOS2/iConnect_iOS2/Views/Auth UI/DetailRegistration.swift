//
//  DetailRegistration.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-05-28.
//

import SwiftUI

struct DetailRegistration: View {
    
    @ObservedObject var viewModel = RegisterVM.shared
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                LogoView(imageName: "person.fill", imageSize: 100, displayColor: .blue)
                
                CustomEmptyView(width: nil, height: 5, foregroundColor: .clear)
                
                Text("Other Information")
                    .font(.title)
                    .bold()
                
                Text(viewModel.genderPickerMessage)
                    .lineLimit(10)
                    .padding()
                    .foregroundColor(.secondary)
                    .frame(height: 120)
                
                GroupBox(label: Label("Date of Birth and Gender", systemImage: "person.fill"), content: {
                    VStack(alignment: .leading, spacing: 13) {
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
                })
                .cornerRadius(25)
                .padding()
                
                NavigationLink(destination: DetailRegistration2()) {
                    Text("Continue")
                        .font(.system(size: 20, weight: .semibold, design: .default))
                        .foregroundColor(.white)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).frame(width: 200, height: 50))
                }.simultaneousGesture(TapGesture().onEnded {
                    let safeDate = viewModel.dateFormatter.string(from: viewModel.dateOfBirth)
                    viewModel.updateUserObject(dateOfBirth: safeDate, isPrivateAccount: viewModel.isPrivateAccount, gender: viewModel.genderPicker, allowDiagnostic: viewModel.allowDiagnostic)
                })
            }
        }
        .padding(.bottom)
    }
}

struct DetailRegistration2: View {
    
    @ObservedObject var viewModel = RegisterVM.shared
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                LogoView(imageName: "person.crop.circle", imageSize: 100, displayColor: .accentColor)
                
                CustomEmptyView(width: nil, height: 5, foregroundColor: .clear)
                
                Text("Private Account")
                    .font(.title)
                    .bold()
                
                Text(viewModel.privateAccountMessage)
                    .lineLimit(10)
                    .padding()
                    .foregroundColor(.secondary)
                    .frame(height: 200)
                
                GroupBox(label: Label("Private Account is recommended", systemImage: "lock.fill")) {
                    Toggle(isOn: $viewModel.isPrivateAccount, label: {
                        Text("Use Private Account")
                    })
                    .toggleStyle(SwitchToggleStyle(tint: .accentColor))
                }
                .cornerRadius(25)
                .padding()
                
                NavigationLink(destination: DetailRegistration3()) {
                    Text("Continue")
                        .font(.system(size: 20, weight: .semibold, design: .default))
                        .foregroundColor(.white)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).frame(width: 200, height: 50))
                }
                .simultaneousGesture(TapGesture().onEnded {
                    let safeDate = viewModel.dateFormatter.string(from: viewModel.dateOfBirth)
                    viewModel.updateUserObject(dateOfBirth: safeDate, isPrivateAccount: viewModel.isPrivateAccount, gender: viewModel.genderPicker, allowDiagnostic: viewModel.allowDiagnostic)
                })
            }
        }
        .padding(.bottom)
    }
}

struct DetailRegistration3: View {
    
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
                        let safeDate = viewModel.dateFormatter.string(from: viewModel.dateOfBirth)
                        viewModel.updateUserObject(dateOfBirth: safeDate, isPrivateAccount: viewModel.isPrivateAccount, gender: viewModel.genderPicker, allowDiagnostic: viewModel.allowDiagnostic)
                    })
            }
        }
        .padding(.bottom)
    }
}

struct DetailRegistration_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                DetailRegistration()
            }
            
            NavigationView {
                DetailRegistration2()
            }
            
            NavigationView {
                DetailRegistration3()
            }
        }
        .previewDevice("iPhone 12")
    }
}
