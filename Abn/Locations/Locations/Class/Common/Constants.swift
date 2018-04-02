//
//  Constants.swift
//  Locations
//
//  Created by Jibin Raju on 30/03/2018.
//  Copyright © 2018 Jibin Raju. All rights reserved.
//

import Foundation

/**
 * Declare different constants here and grouped it based on the usage and purpose.
 */
struct Constants {
    
    /**
     * Google Place API key, Its a private key (created by Jibin Raju by using his personal google acount) for testing purpose
     *
     * For more information about API key please see the documentation in below URL:
     * https://developers.google.com/places/ios-api/
     */
    struct Google {
        static let PlaceAPIKey = "AIzaSyByMYgHw4UeO_PYGoIEof76MfFSFNYBQf8"
    }
    
    enum ErrorCodes: Int {
        case UnKnown = -1
        
        case Success = 0
        
        case EmptyData = 10001
    }
    
    struct WikipediaURL { 
        static let DeepLink = "wikipedia://places"
        static let HostName = "en.wikipedia.org"
        static let Scheme = "https"
        static let Path = "/w/api.php"
        static let PlaceURLKey = "WMFArticleURL"
    }
    
    struct WikipediaQueryItemKey {
        static let Titles = "titles"
        static let Latitude = "latitude"
        static let Longitude = "longitude"
    }
}


