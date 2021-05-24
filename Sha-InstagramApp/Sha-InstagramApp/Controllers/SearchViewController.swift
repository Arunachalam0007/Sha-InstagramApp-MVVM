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
   
    var fillterProfileListVM = ProfileListViewModel()
   
    private let profileSearchController = UISearchController(searchResultsController: nil)
    
    var inSearchMode:Bool {
        return profileSearchController.isActive && !profileSearchController.searchBar.text!.isEmpty
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureProfileSearchController()
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
    
    func configureProfileSearchController(){
        profileSearchController.obscuresBackgroundDuringPresentation = false
        profileSearchController.hidesNavigationBarDuringPresentation = true
        profileSearchController.searchBar.placeholder = "Search Profile"
        
        // get Value or searchResult from UISearchResultsUpdating protocol
        profileSearchController.searchResultsUpdater = self

        // Add searchController to NavSearchController
        navigationItem.searchController = profileSearchController
        definesPresentationContext = false
        navigationController?.navigationBar.tintColor = .black
    }
    
}

// MARK: - TableView Datasource

extension SearchViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inSearchMode ? fillterProfileListVM.profileVMCount : profileListVM.listOfProfileVm.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.userProfileCellIdentifier, for: indexPath) as! UserProfileCell
        if inSearchMode {
            cell.profileVM =  fillterProfileListVM.profileViewModelAtIndex(index: indexPath.row)
        } else {
            cell.profileVM =  profileListVM.profileViewModelAtIndex(index: indexPath.row)
        }
        return cell
    }
}

// MARK: - ProfileListDelegate

extension SearchViewController: ProfileListDelegate {
    func profileListData() {
        tableView.reloadData()
    }
}


// MARK: - UISearchResultsUpdating

extension SearchViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchNameText = searchController.searchBar.text?.lowercased() else { return }
        // In Filter return True It will return that VM, if false It won't return VM
        fillterProfileListVM.listOfProfileVm  = profileListVM.listOfProfileVm.filter { profileVM in
            
            if(profileVM.userName!.lowercased().contains(searchNameText) || profileVM.fullName!.lowercased().contains(searchNameText) ) {
                return true
            }
            return false
        }
        tableView.reloadData()
    }
    
}

