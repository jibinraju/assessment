//
//  PlaceTests.swift
//  LocationsTests
//
//  Created by Jibin Raju on 02/04/2018.
//  Copyright © 2018 Jibin Raju. All rights reserved.
//

import XCTest
@testable import Locations

class PlaceTests: XCTestCase {
    
    func testShouldInitializeProperly() {
        let placeName = "Strip-S"
        let displayName = "Strip-S, Eindhoven, Netherlands"
        let latitude = "72.989734"
        let longitude = "48.56789"
        let gmsPlaceID = "test-google-place-identifier"
        
        let place = Place(place: placeName, displayName: displayName, latitude: latitude, longitude: longitude, gmsPlaceId: gmsPlaceID)
        
        XCTAssertEqual(place.placeName, placeName)
        XCTAssertEqual(place.displayName, displayName)
        XCTAssertEqual(place.latitude, latitude)
        XCTAssertEqual(place.longitude, longitude)
        XCTAssertEqual(place.gmsPlaceId, gmsPlaceID)
    }
    
    func testShouldCreateModelFromDicitonary() {
        let placeName = "Strip-S"
        let displayName = "Strip-S, Eindhoven, Netherlands"
        let latitude = "72.989734"
        let longitude = "48.56789"
        
        let locationInformation = ["place": placeName, "displayname": displayName, "latitude": latitude, "longitude": longitude]
        
        let place = Place(keyValue: locationInformation)
        
        XCTAssertNotNil(place)
        XCTAssertEqual(place?.placeName, placeName)
        XCTAssertEqual(place?.displayName, displayName)
        XCTAssertEqual(place?.latitude, latitude)
        XCTAssertEqual(place?.longitude, longitude)
    }
    
    func testShouldFailedToCreateModelFromDicitonary() {
        let placeName = "Strip-S"
        let displayName = "Strip-S, Eindhoven, Netherlands"
        
        let locationInformation = ["place": placeName, "displayname": displayName]
        
        let place = Place(keyValue: locationInformation)
        
        XCTAssertNil(place)
        XCTAssertNil(place?.placeName)
        XCTAssertNil(place?.displayName)
    }
    
    func testShouldUpdateProperly() {
        let placeName = "Strip-S"
        let displayName = "Strip-S, Eindhoven, Netherlands"
        let latitude = "72.989734"
        let longitude = "48.56789"
        let gmsPlaceID = "test-google-place-identifier"
        
        let place = Place(place: nil, displayName: displayName, latitude: nil, longitude: nil, gmsPlaceId: gmsPlaceID)
        
        XCTAssertNil(place.placeName, placeName)
        XCTAssertEqual(place.displayName, displayName)
        XCTAssertNil(place.latitude, latitude)
        XCTAssertNil(place.longitude, longitude)
        XCTAssertEqual(place.gmsPlaceId, gmsPlaceID)
        
        place.update(place: placeName, latitude: latitude, longitude: longitude)
        
        XCTAssertEqual(place.placeName, placeName)
        XCTAssertEqual(place.latitude, latitude)
        XCTAssertEqual(place.longitude, longitude)
    }
    
}
