//
//  WaitTimeViewController.swift
//  BarTrack-tableView
//
//  Created by Isabel Stoddart on 4/30/18.
//  Copyright © 2018 Cara Nielson. All rights reserved.
//

import UIKit
import Firebase

class WaitTimeViewController: UIViewController {
    
    var venue: Venue?
    
    private var ref: DatabaseReference!
    
    var waitt: String = ""
    
    
    @IBOutlet weak var time: UILabel!
    
    
    
    @IBOutlet weak var wait: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        time.text = ""
        ref = Database.database().reference().child("venues").child((venue?.id!)!).child("waittimee")
    }

    @IBAction func saveWait(_ sender: UIButton) {
        waitt = wait.text!
        let num = Int(waitt)
        if num != nil {
            ref.childByAutoId().setValue(waitt)
        }
        else {
            time.text = "Please Enter a Valid Time"
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? AddInfoViewController {
            destinationVC.venue = venue
        }
    }


}
