//
//  EditProfileScreenVM.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-29.
//

import SwiftUI
import FirebaseDatabase

class EditProfileScreenVM: ObservableObject {
    
    static let viewModel = EditProfileScreenVM()
    
    private let databaseReference = Database.database().reference()
    
    @ObservedObject private var loginVM = LoginScreenVM.viewModel
    
    /// A `RECUser` object temporarily created for editing and is deleted of all values when changes are saved to the database.
    public var tempUser: RECUser = RECUser()
    
    @Published var selectedView = 0
    
    /// The starting color for the gradient.
    @Published var startingColor = Color.red
    
    /// The ending color for the gradient
    @Published var endingColor = Color.blue
    
    /// A temporary string containing the new email address for the user. It will be cleared once the Save button is tapped.
    @Published var tempEmailAddress = ""
    
    // MARK: - FUNCTIONS
    
    /// Write the profile customization info of this user to the database and store them under the user's Firebase UID.
    /// - Parameter firebaseUID: The Firebase UID of this user, acts as a path to store the profile customization data.
    public func writeCustomizationDataToDatabase(with firebaseUID: String) {
        guard let startingHex = self.startingColor.toHex(),
              let endingHex = self.endingColor.toHex() else {
            return
        }
        
        let customizationData: [String: Any] = [
            "startingColor": startingHex,
            "endingColor": endingHex
        ]
        
        databaseReference.child(RECDatabaseParentPath.profileCustomizations).child(firebaseUID).setValue(customizationData)
    }
    
    /// Fetch the color customizations from the database based on the given path and option
    /// - Parameters:
    ///   - firebaseUID: The Firebase UID to look for the values.
    ///   - option: The color option to fetch the data for which color (starting or ending colors.)
    public func fetchProfileCustomizationData(from firebaseUID: String) {
        databaseReference.child(RECDatabaseParentPath.profileCustomizations).child(firebaseUID).getData { [weak self] error, snapshot in
            guard let value = snapshot?.value as? NSDictionary,
                  error == nil else {
                return
            }
            
            let startingHex = value["startingColor"] as! String
            let endingHex = value["endingColor"] as! String
            
            self?.startingColor = Color(hex: startingHex) ?? Color.red
            self?.endingColor = Color(hex: endingHex) ?? Color.blue
        }
    }
}
