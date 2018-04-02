//
//  PredefinedPlaceProviderTests.swift
//  LocationsTests
//
//  Created by Jibin Raju on 02/04/2018.
//  Copyright © 2018 Jibin Raju. All rights reserved.
//

import XCTest
@testable import Locations

class PredefinedPlaceProviderTests: XCTestCase {
    
    func testShouldLoadPredefinedDataProperly() {
        let predefinedData = PredefinedPlaceProvider()
        let path = Bundle.main.path(forResource: "Locations", ofType: "json")
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path!), options: .mappedIfSafe)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            if let jsonResult = jsonResult as? Dictionary<String, Array<Dictionary<String, String>>>, let places = jsonResult["places"] {
                XCTAssertEqual(places.count, predefinedData.places.count)
            }
        }
        catch {
            print("falied to load Locations.json \(String(describing: path))")
        }
    }

}
