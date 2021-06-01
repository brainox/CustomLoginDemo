//
//  ViewController.swift
//  CustomLoginDemo
//
//  Created by Decagon on 30/05/2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var securedEyeBtn: UIButton!
    
    
    @IBOutlet weak var signInBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailField.borderStyle = .none
        emailField.layer.cornerRadius = 20
        password.borderStyle = .none
        password.layer.cornerRadius = 20
        
        signInBtn.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    @IBAction func eyeBtn(_ sender: Any) {
        password.isSecureTextEntry.toggle()
        if password.isSecureTextEntry == true {
            securedEyeBtn.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        } else {
            securedEyeBtn.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        }
    }
    
    @objc private func didTapButton() {
        guard let email = emailField.text, !email.isEmpty,
              let password = password.text, !password.isEmpty else {
            print("Missing Field data")
            return
        }
    }
}

