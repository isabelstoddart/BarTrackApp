//
//  Venue.swift
//  BarTrack-tableView
//
//  Created by Cara Nielson on 4/5/18.
//  Copyright © 2018 Cara Nielson. All rights reserved.
//

import Foundation

class Venue {
    //Properties
    var id: String?
    var name: String?
    var description: String?
    var strictness: String?
    var popularity: String?
    var crowdedness: String?
    var waitTime: String?
    var latitude: String?
    var longitude: String?
    
    
    //Methods
    init(id: String?, name:String?, description:String?, strictness:String?,popularity:String?,crowdedness:String?,waitTime:String?, latitude:String?, longitude:String?) {
        self.id = id
        self.name = name
        self.description = description
        self.strictness = strictness
        self.popularity = popularity
        self.crowdedness = crowdedness
        self.waitTime = waitTime
        self.latitude = latitude
        self.longitude = longitude

    }
}
