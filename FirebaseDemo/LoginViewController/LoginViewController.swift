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
    let hud = JGProgressHUD(style: .dark)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        hud.textLabel.text = "Loading"
    }
    
    @IBAction func loginButtonClicked(_ sender: UIButton) {
        
        self.view.endEditing(true)
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            hud.show(in: self.view)
            
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                
                if error == nil { // Sign In Successful.
                    Utility.invokeAlertMethod("Success", strBody: "You have successfully Logged In.", delegate: self)
                } else {
                    print(error?.localizedDescription)
                }
            }
        }
    }
    
    @IBAction func createAccountButtonClicked(_ sender: UIButton) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            
            hud.show(in: self.view)
            
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                
                self.hud.dismiss(animated: true)
                if error != nil {
                    Utility.invokeAlertMethod("Alert", strBody: error?.localizedDescription ?? "Error occured while creating user account. ", delegate: self)
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
