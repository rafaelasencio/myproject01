//
//  WelcomeViewController.swift
//  proyecto01
//
//  Created by Rafael Asencio on 04/03/2019.
//  Copyright © 2019 Rafael Asencio. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {


    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPass: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnNoAccount: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnLogin.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
    }
    
    @objc func handleSignUp() {
        guard let email = txtFieldEmail.text else { return }
        guard let password = txtFieldPass.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error == nil && user != nil {
                //self.dismiss(animated: true, completion: nil)
                self.performSegue(withIdentifier: "goToMainView", sender: self)
            } else {
                print("Error logging in: \(error!.localizedDescription)")
            }
        }
    }
}
