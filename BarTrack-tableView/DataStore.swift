//
//  DataStore.swift
//  BarTrack-tableView
//
//  Created by Cara Nielson on 4/10/18.
//  Copyright © 2018 Cara Nielson. All rights reserved.
//

import Foundation
import Firebase

class DataStore {
    static let shared = DataStore()
    
    private var ref: DatabaseReference!
    private var venues: [Venue]!
    
    
    private init() {
        ref = Database.database().reference()
    }
    
    func count() -> Int {
        return venues.count
    }
    
    func getVenue(index: Int) -> Venue {
        return venues[index]
    }
    
    func loadVenues() {
        venues = [Venue]()
        
        ref.child("venues").observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            
            if let venuess = value {
                for v in venuess {
                    let venue = v.value as! [String:String]
                    let id = v.key as! String
                    let namee = venue["namee"]
                    let descriptionn = venue["descriptionn"]
                    let strictnesss = venue["strictnesss"]
                    let popularityy = venue["popularityy"]
                    let crowdednesss = venue["crowdednesss"]
                    let waittimee = venue["waittimee"]
                    let latitudee = venue["latitudee"]
                    let longitudee = venue["longitudee"]
                    let newVenue = Venue(id: id, name: namee!, description: descriptionn!, strictness: strictnesss!,popularity: popularityy!, crowdedness: crowdednesss!,waitTime: waittimee!,latitude: latitudee!, longitude: longitudee!)
                    self.venues.append(newVenue)
                }
            }
 
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }
    
    func addVenue(venue: Venue) {
        let venueRecord = [
            "namee": venue.name,
            "descriptionn": venue.description,
            "strictnesss": venue.strictness,
            "popularityy": venue.popularity,
            "crowdednesss": venue.crowdedness,
            "waittimee": venue.waitTime,
            "latitudee": venue.latitude,
            "longitudee": venue.longitude
        ]
        
        self.ref.child("venues").child(venue.id!).setValue(venueRecord)
        
        venues.append(venue)
    }
}
