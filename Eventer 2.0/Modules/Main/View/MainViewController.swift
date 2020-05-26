//
//  MainViewController.swift
//  Eventer 2.0
//
//  Created by Федор Рубченков on 18.04.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    var homeController: UIViewController?
    var eventsController: UIViewController?
    var trackingController: UIViewController?
    var profileController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
    }
    
    private func setupControllers() {
        let events = UINavigationController(rootViewController: eventsController!)
        let home = UINavigationController(rootViewController: homeController!)
        let tracking = UINavigationController(rootViewController: trackingController!)
        let profile = UINavigationController(rootViewController: profileController!)
        
        events.tabBarItem = UITabBarItem(title: "Events", image: #imageLiteral(resourceName: "eventsButton"), selectedImage: nil)
        home.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "homeButton"), selectedImage: nil)
        tracking.tabBarItem = UITabBarItem(title: "Tracking", image: #imageLiteral(resourceName: "trackingButton"), selectedImage: nil)
        profile.tabBarItem = UITabBarItem(title: "Profile", image: #imageLiteral(resourceName: "profileButton"), selectedImage: nil)
        
        self.viewControllers = [home, events, tracking, profile]
    }
    
}
