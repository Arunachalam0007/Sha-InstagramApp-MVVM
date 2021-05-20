//
//  MainTabController.swift
//  Sha-InstagramApp
//
//  Created by ArunSha on 18/05/21.
//

import Foundation
import UIKit

class MainTabController: UITabBarController {
    
    // MARK: - Lifecycle

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabControllers()
        
    }
    
    // MARK: - Helpers
    
    func configureTabControllers() {
        
        // create collViewFlowlayout for initialise FeedCollectionVC
        let collViewFlowLayout = UICollectionViewFlowLayout()
        collViewFlowLayout.minimumLineSpacing = 0
        let feedCollViewController = FeedCollectionViewController(collectionViewLayout: collViewFlowLayout)
        
        // create Nav collectiors for Bar Items
        
        let feedNavController = templateNavigationController(unSelectedImage: UIImage(named: "home_unselected"), selectedImage: UIImage(named:"home_selected"), viewController: feedCollViewController )
        
        let searchNavController = templateNavigationController(unSelectedImage: UIImage(named: "search_unselected"), selectedImage: UIImage(named: "search_selected"), viewController: SearchViewController())
        
        
        let imageSelectorNavController = templateNavigationController(unSelectedImage:  UIImage(named: "plus_unselected"), selectedImage: UIImage(named: "plus_unselected"), viewController: ImageSelectorViewController())
        
        let notificationNavController = templateNavigationController(unSelectedImage:  UIImage(named: "like_unselected"), selectedImage: UIImage(named: "like_selected"), viewController: NotificationViewController())
        
        let profileNavController = templateNavigationController(unSelectedImage:  UIImage(named: "profile_unselected"), selectedImage: UIImage(named: "profile_selected"), viewController: ProfileViewController())
        
        // array of view controller is displayed by the TabBar interface.
        // FeedVc is the first Array of VC so it's Home VC for TabBar
        viewControllers = [feedNavController,
                           searchNavController,
                           imageSelectorNavController,
                           notificationNavController,
                           profileNavController]
        
        tabBar.tintColor = .black // set tab bar color
    }
    
    
    func templateNavigationController(unSelectedImage:UIImage?, selectedImage:UIImage?, viewController:UIViewController) -> UINavigationController {
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unSelectedImage // image for before select the tab
        navController.tabBarItem.selectedImage = selectedImage // image for after selected tab
        navController.navigationBar.tintColor =  .red // Set Naviagation Color
        navController.navigationBar.backgroundColor = .white
        return navController
    }
    
}
