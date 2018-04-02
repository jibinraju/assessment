//
//  LocationListDataSourceTests.swift
//  LocationsTests
//
//  Created by Jibin Raju on 02/04/2018.
//  Copyright © 2018 Jibin Raju. All rights reserved.
//

import XCTest
@testable import Locations

class LocationListDataSourceTests: XCTestCase {
    
    var locationListDataSource: LocationListDataSource!
    var predefinedDataProvider: PredefinedPlaceProvider!
    
    override func setUp() {
        super.setUp()
        
        predefinedDataProvider = PredefinedPlaceProvider()
        locationListDataSource = LocationListDataSource(reuseCellIdentifier: "LocationListCellIdentifier", predefinedPlaceProvider: predefinedDataProvider)
    }
    
    func testShouldConformsTableViewDelegates() {
        XCTAssertTrue(locationListDataSource.conforms(to: UITableViewDelegate.self))
        XCTAssertTrue(locationListDataSource.conforms(to: UITableViewDataSource.self))
    }
    
    func testShouldHaveValidDataSource() {
        let numberOfRows = locationListDataSource.tableView(UITableView(), numberOfRowsInSection: 0)
        XCTAssertEqual(numberOfRows, predefinedDataProvider.places.count)
    }
    
    func testShouldReturnTableViewCellProperly() {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "LocationListCellIdentifier")
        let indexPath = IndexPath(row: 0, section: 0)
        let place = predefinedDataProvider.places.firstObject as? Place
        
        let tableViewCell = locationListDataSource.tableView(tableView, cellForRowAt: indexPath)
        
        XCTAssertNotNil(tableViewCell)
        XCTAssertEqual(tableViewCell.textLabel?.text, place?.displayName)
    }
    
}
