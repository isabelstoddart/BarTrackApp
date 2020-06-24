//
//  LoginViewController.swift
//  BarTrack-tableView
//
//  Created by Cara Nielson on 4/10/18.
//  Copyright © 2018 Cara Nielson. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func loginButton(_ sender: Any) {
        Auth.auth().signIn(withEmail: username.text!, password: password.text!) { (user, error) in
            if error == nil {
                let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                self.present(destinationVC!, animated: true, completion: nil)
            } else {
                self.errorLabel.text = "Please put in your correct password and E-mail"
            }
        }
    }
}
