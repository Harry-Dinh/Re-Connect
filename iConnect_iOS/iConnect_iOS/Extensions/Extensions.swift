//
//  Extensions.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-18.
//

import UIKit

public extension UIDevice {
    
    /// Return the device model and it's name (generation)
    func machineName() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
        
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        
        return machineMirror.children.reduce("") { (identifier, element) in
            guard let value = element.value as? Int8, value != 0 else {
                return identifier
            }
            
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
    }
}
