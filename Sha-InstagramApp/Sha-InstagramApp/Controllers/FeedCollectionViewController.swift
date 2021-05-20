//
//  FeedViewController.swift
//  Sha-InstagramApp
//
//  Created by ArunSha on 18/05/21.
//

import Foundation
import UIKit

private let reuseIdentifier = "Cell"

class FeedCollectionViewController: UICollectionViewController {
    
    var feedAuthVM = FeedAuthenticationViewModel()
    
    // MARK: - Lifecycle

    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.isActiveUser()
        }
        setupUI()
    }
   
    // MARK: - Actions
    
    func isActiveUser() {
        feedAuthVM.getCurrentUser { user in
            guard let user = user else {
                self.showLoginPage()
                return
            }
            print("DEBUG: \(user)")
        }
    }

    @objc func handleLogout(){
        feedAuthVM.getUserLogout { userLogout in
            guard let userLogout = userLogout else {
                print("DEBUG: Sorry Error in Logout")
                return
            }
            print("DEBUG: \(userLogout)")
            self.showLoginPage()
        }
    }
    
    func showLoginPage(){
        let loginVC = LoginViewController()
        let navLoginVC = UINavigationController(rootViewController: loginVC)
        navLoginVC.modalPresentationStyle = .fullScreen
        self.present(navLoginVC, animated: true)
    }
    
    
    // MARK: - Helpers

    func setupUI() {
        collectionView.backgroundColor = .white
        // Register Collection Cell
        collectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        let leftBarBtnItem = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(handleLogout))
        self.navigationItem.leftBarButtonItem = leftBarBtnItem
        self.navigationItem.title = "Feed"
       
    }
    
    
    
}

// MARK: - CollectionView Datasource


extension FeedCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FeedCollectionViewCell
        return cell
    }
    
    
    
}

// MARK: - UICollectionView Delegate Flow layout

extension FeedCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = view.frame.width
        let cellHight = cellWidth + 8 + 40 + 8 + 50 + 60 + 20
        
        
        return CGSize(width: cellWidth, height: cellHight)
    }
}
