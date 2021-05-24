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
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        tableViewConfiguration()
    }
    
    // MARK: - Helpers
    
    func tableViewConfiguration(){
        //Register tableview cell
        tableView.register(UserProfileCell.self, forCellReuseIdentifier: Constants.userProfileCellIdentifier)
        tableView.rowHeight = 80
    }
    
}

extension SearchViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.userProfileCellIdentifier, for: indexPath) as! UserProfileCell
        return cell
    }
}
