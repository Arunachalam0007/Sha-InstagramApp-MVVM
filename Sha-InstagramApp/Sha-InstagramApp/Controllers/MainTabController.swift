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
        
        let feedVC = FeedViewController()
        let searchVC = SearchViewController()
        let imageSelectorVC = ImageSelectorViewController()
        let notificationVc = NotificationViewController()
        let profileVc = ProfileViewController()
        
        // array of view controller is displayed by the TabBar interface.
        // FeedVc is the first Array of VC so it's Home VC for TabBar
        viewControllers = [feedVC,searchVC,imageSelectorVC,notificationVc,profileVc]
        
    }

    
}
