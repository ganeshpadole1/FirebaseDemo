//
//  LoginViewController.swift
//  FirebaseDemo
//
//  Created by ganesh padole on 23/05/20.
//  Copyright © 2020 ganesh padole. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

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
        
        
    }
    
}

extension LoginViewController: UITextFieldDelegate {
 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        return true
    }
}
