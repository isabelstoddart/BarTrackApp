//
//  PopularityViewController.swift
//  BarTrack-tableView
//
//  Created by Isabel Stoddart on 4/30/18.
//  Copyright © 2018 Cara Nielson. All rights reserved.
//

import UIKit
import Firebase

class PopularityViewController: UIViewController {
    
    var venue: Venue?
    
    private var ref: DatabaseReference!
    
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var label: UILabel!
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        label.text = (Int(sender.value).description)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.maximumValue = 10
        
        label.text = ""
        
        ref = Database.database().reference().child("venues").child((venue?.id!)!).child("popularityy")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func updatePopularity(_ sender: Any) {
        ref.childByAutoId().setValue(label.text)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? AddInfoViewController {
            destinationVC.venue = venue
        }
    }
}
