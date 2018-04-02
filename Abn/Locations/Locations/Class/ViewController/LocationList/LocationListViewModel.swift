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
    let searchTextPlaceholder: String
    let cellReuseIdentifier: String
    
    // MARK: init
    override init() {
        self.title = NSLocalizedString("LocationList_Title", comment: "View Controller title")
        self.searchTextPlaceholder = NSLocalizedString("PlaceholderTextForSearchControl", comment: "Place holder text")
        self.cellReuseIdentifier = "LocationListCellIdentifier"
    }
}

