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
import FirebaseUI

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    let hud = JGProgressHUD(style: .dark)
    var authUI: FUIAuth?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        hud.textLabel.text = "Loading"
        self.hideKeyboardWhenTappedAround()
        
        authUI = FUIAuth.defaultAuthUI()
        authUI?.delegate = self
        let providers: [FUIAuthProvider] = [FUIGoogleAuth()]
        authUI?.providers = providers
    }
    
    @IBAction func loginButtonClicked(_ sender: UIButton) {
        
        self.view.endEditing(true)
        
        if let authVC = authUI?.authViewController() {
            present(authVC, animated: true, completion: nil)
        }
//
//        if let email = emailTextField.text, let password = passwordTextField.text {
//            hud.show(in: self.view)
//
//            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
//
//                self.hud.dismiss(animated: true)
//                if error == nil { // Sign In Successful.
//                    Utility.invokeAlertMethod("Success", strBody: "You have successfully Logged In.", delegate: self)
//                } else {
//                    print(error?.localizedDescription)
//                }
//            }
//        }
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
                    Utility.invokeAlertMethod("Success", strBody: error?.localizedDescription ?? "User Account created successfully. ", delegate: self)
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

extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        
        if error == nil {
            print("Login Successful")
            print(authDataResult?.user.email)
        }
    }
}
