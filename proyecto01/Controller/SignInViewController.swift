//
//  SignInViewController.swift
//  proyecto01
//
//  Created by Rafael Asencio on 05/03/2019.
//  Copyright © 2019 Rafael Asencio. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {

    @IBOutlet weak var txtFieldUsername: UITextField!
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var btnHaveAccount: UIButton!
    

    func setSingUpBtn(enabled: Bool) {
        if enabled {
            btnSignUp.alpha = 1.0
            btnSignUp.isEnabled = true
        } else {
            btnSignUp.alpha = 0.5
            btnSignUp.isEnabled = false
        }
    }
    
    @objc func handleSingUp() {
        guard let username = txtFieldUsername.text else { return }
        guard let email = txtFieldEmail.text else { return }
        guard let password = txtFieldPassword.text else { return }
        
        setSingUpBtn(enabled: false)
        Auth.auth().createUser(withEmail: email, password: password) { user, error in
            if error == nil && user != nil {
                print("User created")
                self.performSegue(withIdentifier: "goToMainView", sender: self)
            } else {
                print("Error creating user: \(error!.localizedDescription)")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnSignUp.addTarget(self, action: #selector(handleSingUp), for: .touchUpInside)
        //btnSignUp.alpha = 0.5
        //setSingUpBtn(enabled: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let user = Auth.auth().currentUser {
            self.performSegue(withIdentifier: "goToMainView", sender: self)
        }
    }

}
