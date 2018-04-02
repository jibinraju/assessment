//
//  PredefinedPlaceProvider.swift
//  Locations
//
//  Created by Jibin Raju on 31/03/2018.
//  Copyright © 2018 Jibin Raju. All rights reserved.
//

import UIKit

class PredefinedPlaceProvider: NSObject {
    
    public private(set) var places: NSArray!
    
    override init() {
        super.init()
        self.places = self.loadPlaceData();
    }
    
    private func loadPlaceData() -> NSArray {
        var dataSource: NSMutableArray = []
        if let path = Bundle.main.path(forResource: "Locations", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, Array<Dictionary<String, String>>>, let places = jsonResult["places"] {
                    dataSource = NSMutableArray(capacity: places.count)
                    for placeDictionary in places as [Dictionary<String, String>] {
                        let placeModel = Place(keyValue: placeDictionary)
                        dataSource.add(placeModel!)
                    }
                }
            }
            catch {
                print("failed to parse location jason file")
            }
        }
        
        return dataSource as NSArray
    }
    
}

