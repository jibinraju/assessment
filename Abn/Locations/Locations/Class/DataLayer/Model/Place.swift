//
//  Place.swift
//  Locations
//
//  Created by Jibin Raju on 01/04/2018.
//  Copyright © 2018 Jibin Raju. All rights reserved.
//

import UIKit

class Place: NSObject {
    
    private struct PlaceKey {
        static let Place = "place"
        static let DisplayName = "displayname"
        static let Latitude = "latitude"
        static let Longitude = "longitude"
    }
    
    public private(set) var placeName: String!
    public private(set) var displayName: String!
    public private(set) var latitude: String!
    public private(set) var longitude: String!
    public private(set) var gmsPlaceId: String!
    
    init(place: String?, displayName: String, latitude: String?, longitude: String?, gmsPlaceId: String? = nil) {
        self.placeName = place
        self.displayName = displayName
        self.latitude = latitude
        self.longitude = longitude
        self.gmsPlaceId = gmsPlaceId
    }
    
    convenience init?(keyValue: Dictionary<String, String>) {
        guard let place = keyValue[PlaceKey.Place] as String? else {
            print("Value for key is not avaliable" + PlaceKey.Place)
            return nil
        }
        
        guard let displayName = keyValue[PlaceKey.DisplayName] as String? else {
            print("Value for key is not avaliable" + PlaceKey.DisplayName)
            return nil
        }
        
        guard let latitude = keyValue[PlaceKey.Latitude] as String? else {
            print("Value for key is not avaliable" + PlaceKey.Latitude)
            return nil
        }
        
        guard let longitude = keyValue[PlaceKey.Longitude] as String? else {
            print("Value for key is not avaliable" + PlaceKey.Longitude)
            return nil
        }
        
        self.init(place: place, displayName: displayName, latitude: latitude, longitude: longitude)
    }
    
    func update(place: String?, latitude: String?, longitude: String?) {
        self.placeName = place
        self.latitude = latitude
        self.longitude = longitude
    }
    
}

