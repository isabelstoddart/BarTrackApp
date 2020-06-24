//
//  VenueDetailViewController.swift
//  BarTrack-tableView
//
//  Created by Cara Nielson on 4/9/18.
//  Copyright © 2018 Cara Nielson. All rights reserved.
//

import UIKit
import Firebase

class VenueDetailViewController: UIViewController {
    
    var venue: Venue?
    
    var crowdednesss = [String]()
    var popularityy = [String]()
    var strictnesss = [String]()
    var waittimee = [String]()
    
    private var ref: DatabaseReference!
    
    private var popularityHandle: DatabaseHandle!
    private var crowdednessHandle: DatabaseHandle!
    private var strictnessHandle: DatabaseHandle!
    private var waittimeHandle: DatabaseHandle!
    
    @IBOutlet weak var nameDetail: UILabel!
    
    @IBOutlet weak var descriptionDetail: UILabel!
    
    @IBOutlet weak var imageDetail: UIImageView!
    
    @IBOutlet weak var popularity: UILabel!
    
    @IBOutlet weak var currentWaitTime: UILabel!
    
    @IBOutlet weak var crowdedness: UILabel!
    
    @IBOutlet weak var strictness: UILabel!
    
    @IBOutlet weak var averageWaitTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        nameDetail.text = venue?.name
        descriptionDetail.text = venue?.description
        imageDetail.image = UIImage(named: (venue?.name!)!)
        
        averageWaitTime.text = ""
        currentWaitTime.text = ""
        popularity.text = ""
        crowdedness.text = ""
        strictness.text = ""
        
        getPopularity()
        getCrowdedness()
        getStrictness()
        getWaitTime()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func getPopularity() {
        popularityHandle = ref.child("venues").child((venue?.id!)!).child("popularityy").observe(.childAdded, with: { (snapshot) in
            let popularityValue = snapshot.value as? String
            if let actualPopularity = popularityValue {
                self.popularityy.append(actualPopularity)
                let popularityIntArray = self.popularityy.map { Double($0)!}
                let averagePop = self.averageArray(nums: popularityIntArray)
                let roundedAveragePop = String(format: "%.1f", averagePop)
                self.popularity.text = "\(roundedAveragePop)/10"
            }
        })
    }
    
    private func getCrowdedness() {
        crowdednessHandle = ref.child("venues").child((venue?.id!)!).child("crowdednesss").observe(.childAdded, with: { (snapshot) in
            let crowdednessValue = snapshot.value as? String
            if let actualCrowdedness = crowdednessValue {
                self.crowdednesss.append(actualCrowdedness)
                let crowdednessIntArray = self.crowdednesss.map { Double($0)!}
                let averageCrowd = self.averageArray(nums: crowdednessIntArray)
                let roundedAverageCrowd = String(format: "%.1f", averageCrowd)
                self.crowdedness.text = "\(roundedAverageCrowd)/10"
            }
        })
    }
    
    private func getStrictness() {
        strictnessHandle = ref.child("venues").child((venue?.id!)!).child("strictnesss").observe(.childAdded, with: { (snapshot) in
            let strictnessValue = snapshot.value as? String
            if let actualStrictness = strictnessValue {
                self.strictnesss.append(actualStrictness)
                let strictnessIntArray = self.strictnesss.map { Double($0)!}
                let averageStrict = self.averageArray(nums: strictnessIntArray)
                let roundedAverageStrict = String(format: "%.1f", averageStrict)
                self.strictness.text = "\(roundedAverageStrict)/10"
            }
        })
    }

    private func getWaitTime() {
        popularityHandle = ref.child("venues").child((venue?.id!)!).child("waittimee").observe(.childAdded, with: { (snapshot) in
            let waitValue = snapshot.value as? String
            if let actualWait = waitValue {
                self.waittimee.append(actualWait)
                let waitIntArray = self.waittimee.map { Double($0)!}
                let averageWait = self.averageArray(nums: waitIntArray)
                let roundedAverageWait = String(format: "%.1f", averageWait)
                self.averageWaitTime.text = "\(roundedAverageWait) minutes"
                self.currentWaitTime.text = "\(waitIntArray[waitIntArray.endIndex - 1]) minutes"
            }
        })
    }
    
    private func averageArray(nums: [Double]) -> Double {
        var total = 0.0
        for num in nums {
            total += Double(num)
        }
        let numTotal = Double(nums.count)
        let average = total/numTotal
        return average
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? MapViewController {
            destinationVC.venue = venue
        }
        
        if let destinationVC = segue.destination as? AddInfoViewController {
            destinationVC.venue = venue
        }

     }
}
