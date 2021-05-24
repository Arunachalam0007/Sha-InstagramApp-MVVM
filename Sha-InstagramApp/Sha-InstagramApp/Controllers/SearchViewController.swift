//
//  SearchViewController.swift
//  Sha-InstagramApp
//
//  Created by ArunSha on 18/05/21.
//

import Foundation
import UIKit

class SearchViewController: UITableViewController {
    
    // MARK: - Properties
    
    var profileListVM =  ProfileListViewModel()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableViewConfiguration()
        profileListVM.profileListDelegate = self
        profileListVM.loadAllUserProfile()
    }
    
    // MARK: - Helpers
    
    func tableViewConfiguration(){
        //Register tableview cell
        tableView.register(UserProfileCell.self, forCellReuseIdentifier: Constants.userProfileCellIdentifier)
        tableView.rowHeight = 80
    }
    
}

// MARK: - TableView Datasource

extension SearchViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        profileListVM.listOfProfileVm.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.userProfileCellIdentifier, for: indexPath) as! UserProfileCell
        cell.profileVM =  profileListVM.listOfProfileVm[indexPath.row]
        return cell
    }
}

// MARK: - ProfileListDelegate

extension SearchViewController: ProfileListDelegate {
    func profileListData() {
        tableView.reloadData()
    }
}
