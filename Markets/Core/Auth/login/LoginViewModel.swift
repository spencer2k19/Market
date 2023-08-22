//
//  LoginViewModel.swift
//  Markets
//
//  Created by Loic HACHEME on 15/08/2023.
//

import Foundation

class LoginViewModel {
    
    @Published var errorMsgForEmail = ""
    @Published var errorMsgForPassword = ""
    @Published var isSecuredTextEntry = true
    
    func emailValidation(value: String) {
        errorMsgForEmail = ""
        
        if value.isEmpty {
            errorMsgForEmail = "*Please enter your email address"
            return
        }
        if !isEmailValid(value) {
            errorMsgForEmail = "*Please enter an valid email address"
            return
        }
        
        
    }
    
    
    func toggleSecureTextEntry() {
        isSecuredTextEntry.toggle()
    }
    
    
    func passwordValidation(value: String) {
        errorMsgForPassword = ""
      
        if value.isEmpty  {
            errorMsgForPassword = "*Please enter an valid password"
            return
        }
        
        if value.count < 8 {
            errorMsgForPassword = "Password length must be at least 8 character"
            return
        }
    }
    
    
     func isEmailValid(_ email: String) -> Bool {
        let emailRegEx = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"+"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"+"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"+"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"+"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"+"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"+"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        
        let emailTest = NSPredicate(format:"SELF MATCHES[c] %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    
    
}
