//
//  Validation.swift
//  DemoLogin
//
//  Created by Igor de Castro on 16/04/20.
//  Copyright © 2020 Igor de Castro. All rights reserved.
//

import Foundation

class Validation{
    
    func isValid(the email: String) -> Bool{
        let emailReg = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailReg)
        
        return emailPredicate.evaluate(with: email)
        
    }
    
    
    func isEmpty(the email: String) -> String {
        
        if email.isEmpty {
            return "O campo do email está vazio, digite o email novamente"
        }
        return ""
    }
    
    
    func isValid(password: String) -> Bool {
        let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
    }
}
