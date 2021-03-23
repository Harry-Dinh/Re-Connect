//
//  ContentView.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-15.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    @AppStorage("is_signed_in") var isSignedIn = false
    @AppStorage("write_to_database") var writeUserObjectToDatabase = false
    
    var body: some View {
        if !isSignedIn {
            LoginScreen()
                .padding()
        }
        else {
            CoreScreen()
                .onAppear {
                    let userModel = RegisterVM.shared
                    
                    if Auth.auth().currentUser != nil {
                        writeUserObjectToDatabase = true
                        
                        if writeUserObjectToDatabase {
                            DatabaseManager.shared.createUserObject(firstName: userModel.firstName, lastName: userModel.lastName, email: userModel.emailField)
                            
                            print("Successfully created user object")
                        }
                        
                        writeUserObjectToDatabase = false
                    }
                    else {
                        print("Failed to create user object or an object with the same email/id already exist")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
