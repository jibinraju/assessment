//
//  LocationListDataSource.swift
//  Locations
//
//  Created by Jibin Raju on 30/03/2018.
//  Copyright © 2018 Jibin Raju. All rights reserved.
//

import UIKit
import GooglePlaces

class LocationListDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private var dataSoruce: NSArray!
    private let reuseCellIdentifier: String
    private weak var locationDelegate: LocationListDataSourceDelegate?
    private var gmsPlacesClient: GMSPlacesClient!
    
    // MARK: -
    
    init(reuseCellIdentifier: String, gmsAutoCompletePredicitionData: NSArray, dataSourceDelegate: LocationListDataSourceDelegate? = nil) {
        self.reuseCellIdentifier = reuseCellIdentifier
        self.locationDelegate = dataSourceDelegate
        self.gmsPlacesClient = GMSPlacesClient.shared()
        super.init()
        self.dataSoruce = self.dataSourceFromGMSPredicitionData(autoCompletePredicitionData: gmsAutoCompletePredicitionData);
    }
    
    init(reuseCellIdentifier: String, predefinedPlaceProvider: PredefinedPlaceProvider, dataSourceDelegate: LocationListDataSourceDelegate? = nil) {
        self.reuseCellIdentifier = reuseCellIdentifier
        self.locationDelegate = dataSourceDelegate
        self.dataSoruce = predefinedPlaceProvider.places
    }
    
    // MARK: Helper functions
    
    private func dataSourceFromGMSPredicitionData(autoCompletePredicitionData: NSArray) -> NSArray {
        let autoCompletePredictPlaceNames = NSMutableArray(capacity: autoCompletePredicitionData.count);
        for gmsAutoCompletePrediction in autoCompletePredicitionData as! [GMSAutocompletePrediction] {
            let placeID = gmsAutoCompletePrediction.placeID
            // Retriving the coordinates from the google place API
            self.gmsPlacesClient.lookUpPlaceID(placeID!, callback: { (gmsPlace, error) in
                let gmsPlaceID = gmsPlace?.placeID
                var existingPlace = autoCompletePredictPlaceNames.findMatchingPlace(gmsPlaceID: gmsPlaceID!)
                if existingPlace == nil {
                    existingPlace = self.dataSoruce.findMatchingPlace(gmsPlaceID: gmsPlaceID!)!
                }
                
                let coordinate = gmsPlace?.coordinate
                let latitude = String(format: "%f", (coordinate?.latitude)!)
                let longitude = String(format: "%f", (coordinate?.longitude)!)
                existingPlace?.update(place: gmsPlace?.name, latitude: latitude, longitude: longitude)
            })
            let displayPlace = gmsAutoCompletePrediction.attributedFullText.string
            let place = Place(place: nil, displayName: displayPlace, latitude: nil, longitude: nil, gmsPlaceId: placeID)
            autoCompletePredictPlaceNames.add(place)
        }
        
        return autoCompletePredictPlaceNames as NSArray
    }
    
    
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSoruce.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = (tableView.dequeueReusableCell(withIdentifier: self.reuseCellIdentifier) as UITableViewCell?)!
        let place = self.dataSoruce.object(at: indexPath.row) as? Place
        cell.textLabel?.text = place?.displayName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPlace = self.dataSoruce.object(at: indexPath.row) as? Place
        if self.locationDelegate != nil {
            self.locationDelegate?.didSelectLocation(locationListDataSource: self, selectedPlace: selectedPlace!)
        }
        
        tableView.deselectRow(at: indexPath, animated: true);
    }
    
}

// MARK: LocationListDataSource Delegate

@objc protocol LocationListDataSourceDelegate : NSObjectProtocol {
    func didSelectLocation(locationListDataSource: LocationListDataSource, selectedPlace: Place);
}

