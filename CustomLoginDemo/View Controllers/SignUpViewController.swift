//
//  SignUpViewController.swift
//  CustomLoginDemo
//
//  Created by Decagon on 01/06/2021.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func validateFields() -> String? {
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""  ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields"
        }
        
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        return nil
    }

    func setUpElements() {
        errorLabel.alpha = 0
    
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        // validate the fields
        let error = validateFields()
        
        // Create the user
        if error != nil {
            // There's something wrong with the fields, show error message
            showError(error!)
        } else {
            // Create cleaned versions of the data
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespaces)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespaces)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespaces)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespaces)
            
            // create the user
            Auth.auth().createUser(withEmail: email, password: password) { result, err in
                if let err = err {
                    // There was an error creating the user
                    self.showError("Error creating user")
                } else {
                    // User was created successfully, now store the first name and the last name
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["firstname": firstName,
                                                              "lastname": lastName, "uid": result!.user.uid]) { (error) in
                        if error != nil {
                            // show error message
                            self.showError("Error saving user data")
                        }
                    }
                    
                    // Transition to the home screen
                    self.transitionToHome()
                }
            }
            // Transition to the home screen

        }
        
    }
    
    func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToHome() {
        
    }
}
