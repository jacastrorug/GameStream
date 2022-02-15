//
//  SaveData.swift
//  GameStream
//
//  Created by Julian Castro Ruge on 15/02/22.
//

import Foundation


class SaveData {
    
    var storeKey = "userData"
    
    var email: String = ""
    var password: String = ""
    var userName: String = ""
    
    func saveUserInformation(email: String, password: String, userName: String) -> Bool {
        UserDefaults.standard.set([email, password, userName], forKey: self.storeKey)
        
        return true
    }
    
    func getUserInformation() -> [String] {
        if let userData: [String] = UserDefaults.standard.stringArray(forKey: self.storeKey) {
            return userData
        }
        
        return []
    }
    
    func validate(email: String, password: String) -> Bool {
        var emailSaved = ""
        var passwordSaved = ""
        
        if let userInfo:[String] = UserDefaults.standard.stringArray(forKey: self.storeKey) {
            
            emailSaved = userInfo[0]
            passwordSaved = userInfo[1]
            
            print("Email saved: \(emailSaved), password saved: \(passwordSaved)")
            
            if email == emailSaved && password == passwordSaved {
                return true
            }
            
            
        } else {
            print("No data stored in user defaults")
            
        }
        
        return false
    }
    
}
