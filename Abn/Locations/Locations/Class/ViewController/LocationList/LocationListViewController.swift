//
//  LocationListViewController.swift
//  Locations
//
//  Created by Jibin Raju on 30/03/2018.
//  Copyright © 2018 Jibin Raju. All rights reserved.
//

import UIKit

class LocationListViewController: UIViewController {
    
    // UI controls
    @IBOutlet weak private var userLocationSearchBar: UISearchBar!
    @IBOutlet weak private var locationListTableView: UITableView!
    
    // Class variables
    private var viewModel: LocationListViewModel!
    private var autoCompletionPlaceHandler: AutoCompletionPlaceHandler!
    private var viewDataSource: LocationListDataSource!
    private var predefinedPlaceDataProvider: PredefinedPlaceProvider!
    private var application: UIApplication = UIApplication.shared
    
    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupViewModel()
        self.locationListTableView.register(UITableViewCell.self, forCellReuseIdentifier: self.viewModel.cellReuseIdentifier)
        self.autoCompletionPlaceHandler = AutoCompletionPlaceHandler()
        self.predefinedPlaceDataProvider = PredefinedPlaceProvider()
        self.setupDataSource();
    }
    
    // MARK: Private functions
    
    private func setupViewModel() {
        self.viewModel = LocationListViewModel()
        
        self.title = self.viewModel.title
        self.userLocationSearchBar.placeholder = self.viewModel.searchTextPlaceholder
    }
    
    private func setupDataSource(_ gmsAutoCompletePredcition: NSArray? = nil) {
        if gmsAutoCompletePredcition != nil && (gmsAutoCompletePredcition?.count)! > 0 {
            self.viewDataSource = LocationListDataSource(reuseCellIdentifier: self.viewModel.cellReuseIdentifier, gmsAutoCompletePredicitionData: gmsAutoCompletePredcition!, dataSourceDelegate: self)
        }
        else {
            self.viewDataSource = LocationListDataSource(reuseCellIdentifier: self.viewModel.cellReuseIdentifier, predefinedPlaceProvider: self.predefinedPlaceDataProvider, dataSourceDelegate: self)
        }
        
        self.locationListTableView.dataSource = self.viewDataSource
        self.locationListTableView.delegate = self.viewDataSource
        self.locationListTableView.reloadData()
    }
}

// MARK: extension for UISearch Delegate

extension LocationListViewController : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            self.setupDataSource()
            
            return
        }
        
        self.autoCompletionPlaceHandler.predictPlace(partialNameOfPlace: searchText, callbackBlock: {(results, error) -> Void in
            if let error = error {
                self.showErrorMessageAlert(error: error as NSError)
                self.setupDataSource()
                
                return
            }
            
            if let results = results {
                self.setupDataSource(results as NSArray)
            }
        })
    }
    
    private func showErrorMessageAlert(error: NSError) {
        let alertViewController = UIAlertController.alertWithOKButton(message: error.localizedDescription)
        self.present(alertViewController, animated: true, completion: nil)
    }
}

// MARK: extension for LocationListDataSource Delegate

extension LocationListViewController : LocationListDataSourceDelegate {
    
    func didSelectLocation(locationListDataSource: LocationListDataSource, selectedPlace: Place) {
        let customURL = composeWikipediDeepLinkURL(place: selectedPlace)
        self.application.open(customURL, options: [:], completionHandler: nil)
    }
    
    private func composeWikipediDeepLinkURL(place: Place) -> URL {
        let placeName = place.placeName!.trimmingCharacters(in: .whitespacesAndNewlines)
        let wikiFormattedPlaceName = placeName.replacingOccurrences(of: " ", with: "_")
        var urlComponents = URLComponents()
        urlComponents.scheme = Constants.WikipediaURL.Scheme
        urlComponents.host = Constants.WikipediaURL.HostName
        urlComponents.path = Constants.WikipediaURL.Path
        let titlesQueryItem = URLQueryItem(name: Constants.WikipediaQueryItemKey.Titles, value: wikiFormattedPlaceName)
        let latitudeQueryItem = URLQueryItem(name: Constants.WikipediaQueryItemKey.Latitude, value: place.latitude)
        let longitudeQueryItem = URLQueryItem(name: Constants.WikipediaQueryItemKey.Longitude, value: place.longitude)
        urlComponents.queryItems = [titlesQueryItem, latitudeQueryItem, longitudeQueryItem]
        
        let urlString = String(format: "%@?%@=%@", Constants.WikipediaURL.DeepLink, Constants.WikipediaURL.PlaceURLKey, urlComponents.string!)
        
        return URL(string: urlString)!
    }
}



