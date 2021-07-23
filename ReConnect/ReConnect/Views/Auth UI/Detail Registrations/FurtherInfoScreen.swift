//
//  DetailRegistrationScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-19.
//

import SwiftUI

struct FurtherInfoScreen: View {
    
    @ObservedObject var viewModel = RegisterVM.shared
    
    var body: some View {
        ScrollView {
            VStack {
                LogoView(icon: "person.fill", color: .accentColor)
                    .padding(.vertical)
                
                Text("Other Information")
                    .font(.title)
                    .bold()
                
                Text("Please fill out the following details about you. Re:Connect never and NEVER sells your data to other companies.\n\nYour date of birth will be used to determine your age and hide age-unappropriate contents from you.\n\nYour gender will be used to help people identify you easier and also hide contents that are unrelated or offensive to your gender.")
                    .foregroundColor(.secondary)
                    .padding()
                
                GroupBox {
                    DatePicker("Date of Birth", selection: $viewModel.dateOfBirth, displayedComponents: .date)
                    
                    HStack {
                        Picker(selection: $viewModel.gender, label: Text("Gender"), content: {
                            Text("Female").tag(0)
                            Text("Male").tag(1)
                            Text("Prefer not to say").tag(2)
                        })
                        .pickerStyle(MenuPickerStyle())
                        Spacer()
                    }
                }
                .cornerRadius(17)
                .padding()
                
                NavigationLink(destination: ProfileSetup()) {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .background(
                            Rectangle()
                                .foregroundColor(.accentColor)
                                .cornerRadius(15)
                                .frame(height: 45)
                        )
                }
                .simultaneousGesture(TapGesture().onEnded {
                    viewModel.updateUserInfo(dateOfBirth: viewModel.dateOfBirth, gender: viewModel.gender)
                })
            }
            .padding(.vertical)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailRegistrationScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FurtherInfoScreen()
        }
    }
}
