//
//  EditProfileScreenVM.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-29.
//

import SwiftUI
import FirebaseDatabase

class EditProfileScreenVM: ObservableObject {
    
    enum FetchOption {
        case startingColor
        case endingColor
    }
    
    static let viewModel = EditProfileScreenVM()
    
    private let databaseReference = Database.database().reference()
    
    @ObservedObject private var loginVM = LoginScreenVM.viewModel
    
    public var tempUser: RECUser = RECUser()
    
    @Published var selectedView = 0
    
    @Published var startingColor = Color.red
    @Published var endingColor = Color.blue
    @Published var tempEmailAddress = ""
    
    // MARK: - FUNCTIONS
    
    /// Write the profile customization info of this user to the database and store them under the user's Firebase UID.
    /// - Parameter firebaseUID: The Firebase UID of this user, acts as a path to store the profile customization data.
    public func writeCustomizationDataToDatabase(with firebaseUID: String) {
        guard let startingComponents = self.getRGBComponents(from: self.startingColor),
              let endingComponents = self.getRGBComponents(from: self.endingColor) else {
            return
        }
        
        let startingData: [String: Double] = [
            "red": startingComponents[0],
            "green": startingComponents[1],
            "blue": startingComponents[2]
        ]
        
        let endingData: [String: Double] = [
            "red": endingComponents[0],
            "green": endingComponents[1],
            "blue": endingComponents[2]
        ]
        
        databaseReference.child(RECDatabaseParentPath.profileCustomizations).child(tempUser.getFirebaseUID()).child("startingColor").setValue(startingData)
        databaseReference.child(RECDatabaseParentPath.profileCustomizations).child(tempUser.getFirebaseUID()).child("endingColor").setValue(endingData)
    }
    
    /// Fetch the color customizations from the database based on the given path and option
    /// - Parameters:
    ///   - firebaseUID: The Firebase UID to look for the values.
    ///   - option: The color option to fetch the data for which color (starting or ending colors.)
    public func fetchProfileCustomizationData(from firebaseUID: String, option: FetchOption) {
        let colorPath: String
        
        if option == .startingColor {
            colorPath = "startingColor"
        } else {
            colorPath = "endingColor"
        }
        
        databaseReference.child(RECDatabaseParentPath.profileCustomizations).child(loginVM.loggedInUser?.getFirebaseUID() ?? RECUser.placeholderUser.getFirebaseUID()).child(colorPath).getData { [weak self] error, snapshot in
            guard let value = snapshot?.value as? NSDictionary, error == nil else {
                return
            }
            
            let red = value["red"] as? Double ?? 0
            let green = value["green"] as? Double ?? 0
            let blue = value["blue"] as? Double ?? 0
            
            if option == .startingColor {
                self?.startingColor = Color(red: red, green: green, blue: blue)
            } else {
                self?.endingColor = Color(red: red, green: green, blue: blue)
            }
        }
    }
    
    /// Get the RGB components from the given color. Return them as an array of `Double`.
    /// - Parameter color: The color to get the RGB values from.
    /// - Returns: An array of `Double` containing the three RGB values.
    public func getRGBComponents(from color: Color) -> [Double]? {
        let uiColor = UIColor(color)
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        let rgbRed = red * 255
        let rgbGreen = green * 255
        let rgbBlue = blue * 255
        return [rgbRed, rgbGreen, rgbBlue]
    }
}
