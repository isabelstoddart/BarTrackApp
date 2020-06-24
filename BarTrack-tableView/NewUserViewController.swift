//
//  NewUserViewController.swift
//  BarTrack-tableView
//
//  Created by Cara Nielson on 4/26/18.
//  Copyright © 2018 Cara Nielson. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class NewUserViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func signUp(_ sender: Any) {
        Auth.auth().createUser(withEmail: username.text!, password: password.text!) { (user, error) in
            if error == nil {
                Auth.auth().signIn(withEmail: self.username.text!, password: self.password.text!) { (user, error) in
                    if error == nil {
                        let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                        self.present(destinationVC!, animated: true, completion: nil)
                    } else {
                        print("There was an error")
                    }
                }
            } else {
                print("error")
            }
        }
    }
}
