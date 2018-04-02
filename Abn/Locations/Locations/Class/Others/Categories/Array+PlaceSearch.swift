//
//  Array+PlaceSearch.swift
//  Locations
//
//  Created by Jibin Raju on 01/04/2018.
//  Copyright © 2018 Jibin Raju. All rights reserved.
//

import UIKit

extension NSArray {
    
    func findMatchingPlace(gmsPlaceID: String) -> Place? {
        for place in (self as? [Place])! {
            if place.gmsPlaceId == gmsPlaceID {
                return place
            }
        }
        return nil
    }
    
}

