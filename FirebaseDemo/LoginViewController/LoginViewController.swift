//
//  LoginViewController.swift
//  FirebaseDemo
//
//  Created by ganesh padole on 23/05/20.
//  Copyright © 2020 ganesh padole. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import Firebase
import JGProgressHUD

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @IBAction func loginButtonClicked(_ sender: UIButton) {
    }
    
    @IBAction func createAccountButtonClicked(_ sender: UIButton) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                
                if error != nil {
                    print(result?.user.email ?? "no email")
                } else {
                    print(result?.user.email ?? "no email")
                }
            }
        }
        
    }
    
}

extension LoginViewController: UITextFieldDelegate {
 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        return true
    }
}
