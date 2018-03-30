//
//  ViewController.swift
//  Locations
//
//  Created by Jibin Raju on 30/03/2018.
//  Copyright © 2018 Jibin Raju. All rights reserved.
//

import UIKit
import GooglePlaces

class LocationListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // UI controls
    @IBOutlet weak private var userLocationSearchBar: UISearchBar!
    @IBOutlet weak private var locationListTableView: UITableView!
    
    // Class variables
    private var viewModel : LocationListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupViewModel()
        self.locationListTableView.register(UITableViewCell.self, forCellReuseIdentifier: self.viewModel.cellResueIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Private functions
    private func setupViewModel() {
        self.viewModel = LocationListViewModel()
        
        self.title = self.viewModel.title;
        self.userLocationSearchBar.placeholder = self.viewModel.placeholderTextForSearchControl
    }
    
    // MARK: TableView Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = (tableView.dequeueReusableCell(withIdentifier: self.viewModel.cellResueIdentifier) as UITableViewCell?)!

        cell.textLabel?.text = "Test"
        
        return cell
    }

}

