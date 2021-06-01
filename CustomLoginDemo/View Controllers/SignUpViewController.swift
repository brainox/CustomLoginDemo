//
//  SignUpViewController.swift
//  CustomLoginDemo
//
//  Created by Decagon on 01/06/2021.
//

import UIKit

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
        setUpElements()
    }
    
    func setUpElements() {
        errorLabel.alpha = 0
    
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        // validate the fields
        
        // Create the user
        
        // Transition to the home screen
    }
    
}
