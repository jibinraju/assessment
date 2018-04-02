//
//  LocationListViewModelTests.swift
//  LocationsTests
//
//  Created by Jibin Raju on 02/04/2018.
//  Copyright © 2018 Jibin Raju. All rights reserved.
//

import XCTest
@testable import Locations

class LocationListViewModelTests: XCTestCase {
    
    var viewModel: LocationListViewModel!
    
    override func setUp() {
        super.setUp()
        
        viewModel = LocationListViewModel()
    }

    func testShouldHaveTitle() {
        let title = NSLocalizedString("LocationList_Title", comment: "")
        XCTAssertEqual(viewModel.title, title)
    }
    
    func testShouldHaveSearchTextPlaceHolder() {
        let searchTextPlaceHolder = NSLocalizedString("PlaceholderTextForSearchControl", comment: "")
        XCTAssertEqual(searchTextPlaceHolder, viewModel.searchTextPlaceholder)
    }
    
    func testShouldHaveTableViewCellReuseIdentifier() {
        let cellReuseIdentifier = "LocationListCellIdentifier"
        XCTAssertEqual(cellReuseIdentifier, viewModel.cellReuseIdentifier)
    }
    
}
