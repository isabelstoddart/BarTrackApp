//
//  AddInfoViewController.swift
//  BarTrack-tableView
//
//  Created by Cara Nielson on 5/2/18.
//  Copyright © 2018 Cara Nielson. All rights reserved.
//

import UIKit

class AddInfoViewController: UIViewController {
    
    var venue: Venue?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? CrowdednessViewController {
            destinationVC.venue = venue
        }
        
        if let destinationVC = segue.destination as? StrictnessViewController {
            destinationVC.venue = venue
        }
        
        if let destinationVC = segue.destination as? WaitTimeViewController {
            destinationVC.venue = venue
        }
        
        if let destinationVC = segue.destination as? PopularityViewController {
            destinationVC.venue = venue
        }
        
        if let destinationVC = segue.destination as? VenueDetailViewController {
            destinationVC.venue = venue
        }
    }
}
