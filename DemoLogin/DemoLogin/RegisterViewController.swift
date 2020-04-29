//
//  RegisterViewController.swift
//  DemoLogin
//
//  Created by Igor de Castro on 15/04/20.
//  Copyright © 2020 Igor de Castro. All rights reserved.
//

import Foundation
import UIKit
import CloudKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var errorEmail: UILabel!
    @IBOutlet weak var errorPassword: UILabel!
    
    let privateDataBase = CKContainer(identifier: "iCloud.igor.Tutorial-Cloudkit").privateCloudDatabase
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorEmail.isHidden = true
        errorPassword.isHidden = true
    }
    
    @IBAction func registerBtn(_ sender: Any) {
        let validation = Validation()
        
        
        let email = validation.isEmpty(the: emailTF.text!)
        let pass = validation.isEmpty(the: passwordTF.text!)
        
        if email.isEmpty && pass.isEmpty{
            if !validation.isValid(the: emailTF.text!) {
                errorEmail.isHidden = false
                errorEmail.text = "Email incorreto! Digite algum email valido!"
            } else if validation.isValid(password: passwordTF.text!){
                errorPassword.isHidden = false
                errorPassword.text = "Senha incorreta!"
            } else {
                let record = CKRecord(recordType: "Login")
                
                record.setValue(emailTF.text!, forKey: "email")
                record.setValue(passwordTF.text!, forKey: "password")
                
                privateDataBase.save(record) { (saveRecord, error) in
                    if error == nil {
                        print("Record Save")
                    }else {
                        print("Record not Saved")
                    }
                }
            }
            
        }else {
            errorEmail.isHidden = false
            errorEmail.text = email
            errorPassword.isHidden = false
            errorPassword.text = pass
        }

    }
    
    
    @IBAction func goBack(_ sender: Any) {
        
        performSegue(withIdentifier: "goLogin", sender: nil)
        
    }
    
    
}
