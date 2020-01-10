//
//  SignUpLogInViewController.swift
//  FoodieFun
//
//  Created by Alex Shillingford on 1/6/20.
//  Copyright © 2020 Alex Shillingford. All rights reserved.
//

import UIKit

@IBDesignable class SignUpLogInViewController: UIViewController {
    
    @IBOutlet weak var signUpLogInSegmentedControl: UISegmentedControl!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Incomplete registration!", message: "Please fill out all the text fields before continuing", preferredStyle: .alert)
                   let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                   alert.addAction(alertAction)
        
        if signUpLogInSegmentedControl.selectedSegmentIndex == 0 {
            
            guard let email = emailTextField.text,
                !email.isEmpty,
                let username = usernameTextField.text,
                !username.isEmpty,
                let password = passwordTextField.text,
                !password.isEmpty,
                let confirmedPassword = confirmPasswordTextField.text,
                !confirmedPassword.isEmpty,
                let location = locationTextField.text,
                !location.isEmpty else {
                    DispatchQueue.main.async {
                        self.present(alert, animated: true, completion: nil)
                    }
                    return
            }
            let user = User(id: nil, username: username, password: password, email: email, location: location)
            
            NetworkController.shared.signUpNewUser(user: user) { (error) in
                if let error = error {
                    print("Error occured during sign up: \(error)")
                } else {
                    DispatchQueue.main.async {
                        let alertController = UIAlertController(title: "Sign up Successful", message: "Now please log in.", preferredStyle: .alert)
                        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                        alertController.addAction(alertAction)
                        self.present(alertController, animated: true, completion:  {
                            
                        })
                    }
                }
            }
        } else {
            guard let username = usernameTextField.text,
                !username.isEmpty,
                let password = passwordTextField.text,
                !password.isEmpty else {
                    DispatchQueue.main.async {
                        self.present(alert, animated: true, completion: nil)
                    }
                    return
            }
//            guard let user = NetworkController.shared.user else { return }
            NetworkController.shared.logIn(with: username, password: password) { (error) in
                if let error = error {
                    NSLog("Error occured during log in: \(error)")
                } else {
                    DispatchQueue.main.async {
                        self.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    @IBAction func signInTypeChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            emailTextField.isHidden = false
            usernameTextField.isHidden = false
            passwordTextField.isHidden = false
            confirmPasswordTextField.isHidden = false
            locationTextField.isHidden = false
            self.signUpButton.setTitle("Sign Up", for: .normal)
        } else {
            emailTextField.isHidden = true
            usernameTextField.isHidden = false
            passwordTextField.isHidden = false
            confirmPasswordTextField.isHidden = true
            locationTextField.isHidden = true
            self.signUpButton.setTitle("Sign In", for: .normal)
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
