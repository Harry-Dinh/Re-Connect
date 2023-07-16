//
//  ContentView.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-08.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var loginVM = LoginScreenVM.viewModel
    @ObservedObject private var editProfileVM = EditProfileScreenVM.viewModel
    @ObservedObject private var notificationManager = NotificationManager.shared
    
    var body: some View {
        if loginVM.isSignedIn {
            CoreScreen()
                .onAppear {
                    // Initial read
                    loginVM.readLoggedInUser()
                    
                    // Read to update profile
                    loginVM.fetchUserDataFromDatabase(with: loginVM.currentUser?.getFirebaseUID() ?? RECUser.placeholderUser.getFirebaseUID())
                    
                    editProfileVM.fetchProfileCustomizationData(from: loginVM.currentUser?.getFirebaseUID() ?? RECUser.placeholderUser.getFirebaseUID())
                    
                    notificationManager.fetchNotifications(for: loginVM.currentUser ?? RECUser.placeholderUser)
                }
        } else {
            LoginScreen()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
