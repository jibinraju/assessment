//
//  LocationListViewControllerTests.swift
//  LocationsTests
//
//  Created by Jibin Raju on 02/04/2018.
//  Copyright © 2018 Jibin Raju. All rights reserved.
//

import XCTest
@testable import Locations

class LocationListViewControllerTests: XCTestCase {
    
    var locationListViewController: LocationListViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: LocationListViewController = storyboard.instantiateViewController(withIdentifier: "LocationListViewController") as! LocationListViewController
        locationListViewController = vc
        _ = locationListViewController.view
    }

    func testShouldHaveTitle() {
        XCTAssertNotNil(locationListViewController.title)
    }
    
    func testShouldConformsSearchBarDelegate() {
        XCTAssertTrue(locationListViewController.conforms(to: UISearchBarDelegate.self))
    }
    
    func testShouldConformsLocationListDataSourceDelegate() {
        XCTAssertTrue(locationListViewController.conforms(to: LocationListDataSourceDelegate.self))
    }

}
