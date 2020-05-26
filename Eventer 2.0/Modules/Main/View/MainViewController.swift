//
//  MainViewController.swift
//  Eventer 2.0
//
//  Created by Федор Рубченков on 18.04.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    var eventsController: UIViewController?
    var trackingController: UIViewController?
    var profileController: UIViewController?
    var createViewController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func setupControllers() {
        let events = UINavigationController(rootViewController: eventsController!)
        let tracking = UINavigationController(rootViewController: trackingController!)
        let profile = UINavigationController(rootViewController: profileController!)
        let create = UINavigationController(rootViewController: createViewController!)
        
        events.tabBarItem = UITabBarItem(title: "Events", image: #imageLiteral(resourceName: "eventsButton"), selectedImage: nil)
        tracking.tabBarItem = UITabBarItem(title: "Tracking", image: #imageLiteral(resourceName: "trackingButton"), selectedImage: nil)
        create.tabBarItem = UITabBarItem(title: "Create", image: #imageLiteral(resourceName: "creaete"), selectedImage: nil)
        profile.tabBarItem = UITabBarItem(title: "Profile", image: #imageLiteral(resourceName: "profileButton"), selectedImage: nil)
        
        self.viewControllers = [events, create, tracking, profile]
    }
    
}
