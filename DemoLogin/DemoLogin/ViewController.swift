//
//  ViewController.swift
//  DemoLogin
//
//  Created by Igor de Castro on 15/04/20.
//  Copyright © 2020 Igor de Castro. All rights reserved.
//

import UIKit
import CloudKit

class ViewController: UIViewController {

    var emails = [String]()
    var passwords = [String]()
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var senhaError: UILabel!
    @IBOutlet weak var logouText: UILabel!
    
    let privateDataBase = CKContainer(identifier: "iCloud.igor.Tutorial-Cloudkit").privateCloudDatabase
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginBtn(_ sender: Any) {
        
        let predicate = NSPredicate(value: true)

        let query = CKQuery(recordType: "Login", predicate: predicate)
        query.sortDescriptors = [NSSortDescriptor(key: "modificationDate", ascending: false)]

        let operation = CKQueryOperation(query: query)

        operation.recordFetchedBlock = {record in

            self.emails.append(record["email"]!)
            self.passwords.append(record["password"]!)
        }
        
        privateDataBase.add(operation)
        
        for email in self.emails {
            if email != emailText.text {
                emailError.isHidden = false
                emailError.text = "Email não cadastrado!"
            }else{
                emailError.text = ""
            }
        }
        
        for pass in passwords {
            if pass != passwordText.text {
                senhaError.isHidden = false
                senhaError.text = "Senha incorreta"
            }else {
                senhaError.text = ""
            }
        }
        
        if emailError.text!.isEmpty && senhaError.text!.isEmpty {
            logouText.isHidden = false
            logouText.text = "Login realizado!"
        }else {
            logouText.text = ""
        }
    }
    
    @IBAction func signUpBtn(_ sender: Any) {
        
        performSegue(withIdentifier: "goRegister", sender: nil)
        
        
        
    }
    
}

