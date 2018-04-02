//
//  AutoCompletionPlaceHandler.swift
//  Locations
//
//  Created by Jibin Raju on 30/03/2018.
//  Copyright © 2018 Jibin Raju. All rights reserved.
//

import UIKit
import GooglePlaces

class AutoCompletionPlaceHandler: NSObject {
    // class variables
    private let gmsPlacesClient: GMSPlacesClient
    private let gmsAutoCompleteFilter: GMSAutocompleteFilter
    
    override init() {
        self.gmsPlacesClient = GMSPlacesClient.shared()
        self.gmsAutoCompleteFilter = GMSAutocompleteFilter()
        self.gmsAutoCompleteFilter.type = .noFilter
    }
    
    func predictPlace(partialNameOfPlace: String,  callbackBlock: @escaping GMSAutocompletePredictionsCallback) {
        if partialNameOfPlace.isEmpty {
            callbackBlock(nil, NSError(domain: "Empty Data", code: Constants.ErrorCodes.EmptyData.rawValue, userInfo: nil))
            return
        }
        
        self.gmsPlacesClient.autocompleteQuery(partialNameOfPlace, bounds: nil, filter: self.gmsAutoCompleteFilter, callback: callbackBlock)
    }
    
}

