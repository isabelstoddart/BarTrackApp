//
//  SettingsViewController.swift
//  BarTrack-tableView
//
//  Created by Cara Nielson on 4/28/18.
//  Copyright © 2018 Cara Nielson. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.displayEmail.text = email
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    let email = Auth.auth().currentUser?.email
    
    @IBOutlet weak var displayEmail: UILabel!
    
    @IBAction func signOut(_ sender: Any) {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                    let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "Login")
                    self.present(destinationVC!, animated: true, completion: nil)
            } catch {
                print ("error")
            }
        }
    }
}
