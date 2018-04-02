//
//  ArrayPlaceSearchTests.swift
//  LocationsTests
//
//  Created by Jibin Raju on 02/04/2018.
//  Copyright © 2018 Jibin Raju. All rights reserved.
//

import XCTest
@testable import Locations

class ArrayPlaceSearchTests: XCTestCase {
    
    func testHappyFlow() {
        let placeName = "Strip-S"
        let displayName = "Strip-S, Eindhoven, Netherlands"
        let latitude = "72.989734"
        let longitude = "48.56789"
        let gmsPlaceID = "test-google-place-identifier"
        
        let place = Place(place: placeName, displayName: displayName, latitude: latitude, longitude: longitude, gmsPlaceId: gmsPlaceID)
        let places = NSArray(arrayLiteral: place)
        
        let foundPlace = places.findMatchingPlace(gmsPlaceID: gmsPlaceID)
        
        XCTAssertNotNil(foundPlace)
        XCTAssertEqual(foundPlace?.gmsPlaceId, gmsPlaceID)
    }
    
    func testShouldReturnNilForUnKnowPlaceID() {
        let placeName = "Strip-S"
        let displayName = "Strip-S, Eindhoven, Netherlands"
        let latitude = "72.989734"
        let longitude = "48.56789"
        let gmsPlaceID = "test-google-place-identifier"
        let unKnowGMSPlaceID = "test-unknow-place-identifier"
        
        let place = Place(place: placeName, displayName: displayName, latitude: latitude, longitude: longitude, gmsPlaceId: gmsPlaceID)
        let places = NSArray(arrayLiteral: place)
        
        let foundPlace = places.findMatchingPlace(gmsPlaceID: unKnowGMSPlaceID)
        
        XCTAssertNil(foundPlace)
    }
    
}
