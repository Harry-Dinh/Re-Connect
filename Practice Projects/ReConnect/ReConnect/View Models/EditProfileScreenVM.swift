//
//  EditProfileScreenVM.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-29.
//

import SwiftUI
import FirebaseDatabase
import FirebaseStorage
import PhotosUI

class EditProfileScreenVM: ObservableObject {
    
    // MARK: - CLASS PROPERTIES
    
    static let viewModel = EditProfileScreenVM()
    
    /// A local reference to Firebase Database.
    private let databaseReference = Database.database().reference()
    
    /// A local reference to Firebase Storage bucket.
    private let storageReference = Storage.storage().reference()
    
    /// A `RECUser` object temporarily created for editing and is deleted of all values when changes are saved to the database.
    public var tempUser: RECUser = RECUser()
    
    /// The character limit for the user's display name
    public let DISPLAY_NAME_MAX = 50
    
    public let DISPLAY_NAME_MIN = 1
    
    /// The character limit for the user's username
    public let USERNAME_MAX = 15
    
    /// The minimum number of characters for the user's username
    public let USERNAME_MIN = 4
    
    // MARK: - SWIFTUI VIEWS PROPERTIES
    
    @ObservedObject private var loginVM = LoginScreenVM.viewModel
    
    @Published var selectedView = 0
    
    /// The starting color for the gradient background.
    @Published var startingColor = Color.red
    
    /// The ending color for the gradient background.
    @Published var endingColor = Color.blue
    
    /// The starting color of the theme gradient background.
    @Published var themeStartingColor = Color(.systemBackground)
    
    /// The ending color of the theme gradient background.
    @Published var themeEndingColor = Color(.systemBackground)
    
    /// An array of `PhotosPickerItem` that will be use to store the selected profile picture.
    @Published var selectedImages: [PhotosPickerItem] = []
    
    /// The placeholder image to preview the selected profile picture.
    @Published var previewImage: Image?
    
    /// The data of the profile picture that will be fed to `previewImage`.
    @Published var imageData: Data?
    
    // MARK: - SWIFTUI VIEWS STATES
    
    /// Tell SwiftUI to present the system image picker.
    @Published var presentImagePicker = false
    
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
        self.writeProfilePicDataToStorage(with: firebaseUID)
    }
    
    /// Fetch the color customizations from the database based on the given path and option
    /// - Parameters:
    ///   - firebaseUID: The Firebase UID to look for the values.
    public func fetchProfileCustomizationData(from firebaseUID: String) {
        databaseReference.child(RECDatabaseParentPath.profileCustomizations).child(firebaseUID).getData { [weak self] error, snapshot in
            guard let value = snapshot?.value as? NSDictionary,
                  error == nil else {
                print("Failed to fetch \(firebaseUID) colors")
                return
            }
            
            let startingHex = value["startingColor"] as! String
            let endingHex = value["endingColor"] as! String
            
            self?.startingColor = Color(hex: startingHex) ?? Color.red
            self?.endingColor = Color(hex: endingHex) ?? Color.blue
            self?.themeStartingColor = Color(hex: startingHex) ?? Color(.systemBackground)
            self?.themeEndingColor = Color(hex: endingHex) ?? Color(.systemBackground)
        }
    }
    
    /// Does the same operation as `fetchProfileCustomizationData()` but it returns the colors as an array of `Color` instead.
    /// - Parameter firebaseUID: The Firebase UID to look for the values.
    /// - Returns: An array of `Color` that holds the left color and right color of the user's banner.
    public func returnProfileCustomizationData(from firebaseUID: String) -> [Color] {
        var fetchedColors: [Color] = []
        
        databaseReference.child(RECDatabaseParentPath.profileCustomizations).child(firebaseUID).getData { error, snapshot in
            guard let value = snapshot?.value as? NSDictionary,
                  error == nil else {
                print("Failed to fetch \(firebaseUID) colors")
                return
            }
            
            let startingHex = value["startingColor"] as! String
            let endingHex = value["endingColor"] as! String
            
            print("\(startingHex), \(endingHex)")
            
            fetchedColors.append(Color(hex: startingHex) ?? .red)
            fetchedColors.append(Color(hex: endingHex) ?? .blue)
        }
        return fetchedColors
    }
    
    public func writeProfilePicDataToStorage(with firebaseUID: String) {
        guard let imageData = self.imageData else {
            return
        }
        
        let storagePath = storageReference.child(RECStorageParentPath.profilePictures).child(firebaseUID)
        storagePath.putData(imageData) { [weak self] _, error in
            guard error == nil else {
                return
            }
            
            storagePath.downloadURL { url, error in
                guard let pfpURL = url, error == nil else {
                    return
                }
                
                self?.loginVM.currentUser?.pfpURL = pfpURL.absoluteString
                print("pfp URL: \(self?.loginVM.currentUser?.pfpURL ?? "No URL")")
                let updatedUserData: [String: Any] = [
                    "pfpURL": pfpURL.absoluteString
                ]
                self?.databaseReference.child(RECDatabaseParentPath.users).child(firebaseUID).updateChildValues(updatedUserData)
                self?.loginVM.cacheLoggedInUser()
            }
        }
    }
}
