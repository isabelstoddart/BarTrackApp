//
//  TableViewController.swift
//  BarTrack-tableView
//
//  Created by Cara Nielson on 4/5/18.
//  Copyright © 2018 Cara Nielson. All rights reserved.
//

import UIKit
import Firebase

class TableViewController: UITableViewController, UISearchBarDelegate {
    
    var venues = [Venue]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //DataStore.shared.loadVenues()
        createDataModel()
        //createDatabase()
        self.searchBarSetup()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    func searchBarSetup() {
        searchBar.delegate = self
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            venues = [Venue]()
            createDataModel()
            self.tableView.reloadData()
        } else {
            filterTableView(text: searchText)
        }
    }
    
    func filterTableView(text:String) {
        venues = venues.filter({ (mod) -> Bool in
            return (mod.name?.lowercased().contains(text.lowercased()))!
        })
        self.tableView.reloadData()
    }

    private func createDatabase() {
        DataStore.shared.addVenue(venue: Venue(id: "0",name:"Upstairs at Caroline", description:"Austin's premier urban backyard party", strictness: "0", popularity: "0", crowdedness: "0", waitTime: "0", latitude: "30.2688", longitude: "-97.7423"))
        DataStore.shared.addVenue(venue: Venue(id: "1",name:"Elephant Room", description:"Cool jazz in the basement since 1991", strictness: "0", popularity: "0", crowdedness: "0", waitTime: "0", latitude: "30.2656", longitude: "-97.7432"))
        DataStore.shared.addVenue(venue: Venue(id: "2",name:"Green Light Social", description:"Organic Austin patio bar with an upscale yet casual vibe", strictness: "0", popularity: "0", crowdedness: "0", waitTime: "0", latitude: "30.2704", longitude: "-97.7503"))
        DataStore.shared.addVenue(venue: Venue(id: "3", name:"The Ranch", description:"One-of-a kind upscale Texas bar", strictness: "0", popularity: "0", crowdedness: "0", waitTime: "0", latitude: "30.2704", longitude: "-97.7500"))
        DataStore.shared.addVenue(venue: Venue(id: "4",name:"Chupacabra Cantina", description:"6th Street's best Tex-Mex and Tequila", strictness: "0", popularity: "0", crowdedness: "0", waitTime: "0", latitude: "30.2674", longitude: "-97.7391"))
        DataStore.shared.addVenue(venue: Venue(id: "5", name:"Container Bar Austin", description:"Seven stacked shipping containers, great vibes, and new way of space", strictness: "0", popularity: "0", crowdedness: "0", waitTime: "0", latitude: "30.2603", longitude: "-97.7385"))
        DataStore.shared.addVenue(venue: Venue(id: "6", name:"Gloria's Latin Cuisine", description:"Distinct Latin flavor and authentic charm", strictness: "0", popularity: "0", crowdedness: "0", waitTime: "0", latitude: "30.2691", longitude: "-97.7458"))
        DataStore.shared.addVenue(venue: Venue(id: "7", name:"Iron Cactus", description:"Contemporary Mexican Dining infused with traditional Mexican flavors", strictness: "0", popularity: "0", crowdedness: "0", waitTime: "0", latitude: "30.2674", longitude: "-97.7394"))
        DataStore.shared.addVenue(venue: Venue(id: "8", name:"The Roosevelt Room", description:"Inventive craft cocktains served in an airy, industrial-chic space", strictness: "0", popularity: "0", crowdedness: "0", waitTime: "0", latitude: "30.2677", longitude: "-97.7463"))
        DataStore.shared.addVenue(venue: Venue(id: "9", name:"Easy Tiger", description:"Bake shop and beer garden", strictness: "0", popularity: "0", crowdedness: "0", waitTime: "0", latitude: "30.2659", longitude: "-97.7357"))
        DataStore.shared.addVenue(venue: Venue(id: "10", name:"Blind Pig Pub", description:"The largest rooftop deck on 6th Street with amazing views of the Austin skyline", strictness: "0", popularity: "0", crowdedness: "0", waitTime: "0", latitude: "30.2670", longitude: "-97.7399"))
    }

    
    private func createDataModel() {
        //append each venue's info to the venue array
        venues.append(Venue(id: "0",name:"Upstairs at Caroline", description:"Austin's premier urban backyard party", strictness:"0", popularity: "0", crowdedness: "0", waitTime: "0", latitude: "30.2688", longitude: "-97.7423"))
        venues.append(Venue(id: "1",name:"Elephant Room", description:"Cool jazz in the basement since 1991", strictness: "0", popularity: "0", crowdedness: "0", waitTime: "0", latitude: "30.2656", longitude: "-97.7432"))
        venues.append(Venue(id: "2",name:"Green Light Social", description:"Organic Austin patio bar with an upscale yet casual vibe", strictness: "0", popularity: "0", crowdedness: "0", waitTime: "0", latitude: "30.2704", longitude: "-97.7503"))
        venues.append(Venue(id: "3", name:"The Ranch", description:"One-of-a kind upscale Texas bar", strictness: "0", popularity: "0", crowdedness: "0", waitTime: "0", latitude: "30.2704", longitude: "-97.7500"))
        venues.append(Venue(id: "4",name:"Chupacabra Cantina", description:"6th Street's best Tex-Mex and Tequila", strictness: "0", popularity: "0", crowdedness: "0", waitTime: "0", latitude: "30.2674", longitude: "-97.7391"))
        venues.append(Venue(id: "5", name:"Container Bar Austin", description:"Seven stacked shipping containers, great vibes, and new way of space", strictness: "0", popularity: "0", crowdedness: "0", waitTime: "0", latitude: "30.2603", longitude: "-97.7385"))
        venues.append(Venue(id: "6", name:"Gloria's Latin Cuisine", description:"Distinct Latin flavor and authentic charm", strictness: "0", popularity: "0", crowdedness: "0", waitTime: "0", latitude: "30.2691", longitude: "-97.7458"))
        venues.append(Venue(id: "7", name:"Iron Cactus", description:"Contemporary Mexican Dining infused with traditional Mexican flavors", strictness: "0", popularity: "0", crowdedness: "0", waitTime: "0", latitude: "30.2674", longitude: "-97.7394"))
        venues.append(Venue(id: "8", name:"The Roosevelt Room", description:"Inventive craft cocktains served in an airy, industrial-chic space", strictness: "0", popularity: "0", crowdedness: "0", waitTime: "0", latitude: "30.2677", longitude: "-97.7463"))
        venues.append(Venue(id: "9", name:"Easy Tiger", description:"Bake shop and beer garden", strictness: "0", popularity: "0", crowdedness: "0", waitTime: "0", latitude: "30.2659", longitude: "-97.7357"))
        venues.append(Venue(id: "10", name:"Blind Pig Pub", description:"The largest rooftop deck on 6th Street with amazing views of the Austin skyline", strictness: "0", popularity: "0", crowdedness: "0", waitTime: "0", latitude: "30.2670", longitude: "-97.7399"))
        venues.append(Venue(id: "11", name:"Kung Fu Saloon", description:"Full bar plus old-school video games, foosball & Skee-Ball", strictness: "0", popularity: "0", crowdedness: "0", waitTime: "0", latitude: "30.270327", longitude: "-97.750338"))
        venues.append(Venue(id:"12", name:"Unbarlievable", description:"Offbeat blue & red circus-themed bar serving beer, wine, creative cocktails and American fare", strictness: "0", popularity: "0", crowdedness: "0", waitTime: "0", latitude: "30.258879", longitude: "-97.738958"))
        venues.append(Venue(id:"13", name:"Pete's Dueling Piano Bar", description:"Lively local bar chain offering speciality cocktails, dueling-piano shows & singing waitstaff", strictness: "0", popularity: "0", crowdedness: "0", waitTime: "0", latitude: "30.266615", longitude: "-97.738634"))
        venues.append(Venue(id:"14", name:"Star Bar", description:"Unpretentious taproom with 2 patios", strictness: "0", popularity: "0", crowdedness: "0", waitTime: "0", latitude: "30.269952", longitude: "-97.748538"))
        venues.append(Venue(id:"15", name:"The Aquarium on 6th", description:"Beer pong & drink specials draw boisterous crowds to this bi-level bar & its fish-tank decor", strictness: "0", popularity: "0", crowdedness: "0", waitTime: "0", latitude: "30.266767", longitude: "-97.739183"))
        venues.append(Venue(id:"16", name:"Bungalow", description: "An easygoing bar with sports, music, regular specials & a big backyard with games & a taco truck", strictness: "0", popularity: "0", crowdedness: "0", waitTime: "0", latitude: "30.260505", longitude: "-97.738366"))
        venues.append(Venue(id:"17", name:"Barbarella", description: "A diverse crowd heads to this Downtown club for various theme nights, DJs & multiple dance floors", strictness: "0", popularity: "0", crowdedness: "0", waitTime: "0", latitude: "30.267081", longitude: "-97.736810"))
        venues.append(Venue(id:"18", name:"Cheer Up Charlie's", description: "Sizable gay bar offering a lodgelike indoor space, outdoor music, drinks, drag shows & more", strictness: "0", popularity: "0", crowdedness: "0", waitTime: "0", latitude: "30.269610", longitude: "-97.736358"))
        venues.append(Venue(id:"19", name:"RIO", description:"Multilevel hot spot with mod sports bar, lounge fare & a swish rooftop club with a pool & cabanas", strictness: "0", popularity: "0", crowdedness: "0", waitTime: "0", latitude: "30.270008", longitude: "-97.749221"))
        venues.append(Venue(id:"20", name:"Shakespeare's", description:"Rollicking destination featuring liquor pitchers, DJs & dancing, plus a rooftop patio with views", strictness: "0", popularity: "0", crowdedness: "0", waitTime: "0", latitude: "30.267347", longitude: "-97.739803"))
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return venues.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! TableViewCell

        // Configure the cell...
        
        let venue = venues[indexPath.row]
        
        cell.nameLabel.text = venue.name
        
        cell.descriptionLabel.text = venue.description
        
        cell.venueImage.image = UIImage(named: venue.name!)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight(for: indexPath)
    }
    
    private func rowHeight(for indexPath: IndexPath) -> CGFloat {
            return 130
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if let destinationVC = segue.destination as? VenueDetailViewController,
            let selectedIndexPath = tableView.indexPathForSelectedRow {
            destinationVC.venue = venues[selectedIndexPath.row]
        }
    }
}
