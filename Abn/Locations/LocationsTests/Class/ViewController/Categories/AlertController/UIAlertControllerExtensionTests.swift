//
//  UIAlertControllerExtensionTests.swift
//  LocationsTests
//
//  Created by Jibin Raju on 30/03/2018.
//  Copyright © 2018 Jibin Raju. All rights reserved.
//

import XCTest
@testable import Locations

class UIAlertControllerExtensionTests: XCTestCase {
    
    func testHappyFlow() {
        let title = NSLocalizedString("App_Name", comment: "")
        let okButtonTitle = NSLocalizedString("OK", comment: "")
        
        let alertControllerWithOk = UIAlertController.alertWithOKButton(message: "Alert Testing")
        
        XCTAssertEqual(alertControllerWithOk.title, title)
        let okAlertAction = alertControllerWithOk.actions.first
        XCTAssertNotNil(okAlertAction)
        XCTAssertEqual(okAlertAction?.title, okButtonTitle)
    }
    
}
