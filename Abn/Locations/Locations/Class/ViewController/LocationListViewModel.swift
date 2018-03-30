//
//  LocationListViewModel.swift
//  Locations
//
//  Created by Jibin Raju on 30/03/2018.
//  Copyright © 2018 Jibin Raju. All rights reserved.
//

import Foundation

class LocationListViewModel : NSObject {
    let title: String
    let placeholderTextForSearchControl: String
    let cellResueIdentifier: String
    
    // MARK: init
    override init() {
        self.title = NSLocalizedString("LocationList_Title", comment: "View Controller title")
        self.placeholderTextForSearchControl = NSLocalizedString("PlaceholderTextForSearchControl", comment: "Place holder text")
        self.cellResueIdentifier = "LocationListCellIdentifier"
    }
}
