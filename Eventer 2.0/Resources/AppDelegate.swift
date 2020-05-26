//
//  AppDelegate.swift
//  Eventer 2.0
//
//  Created by Федор Рубченков on 31.03.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow()
        
        switch LaunchInstructor.setup() {
        case .authorization:
            window.rootViewController = UINavigationController(rootViewController: LaunchInstructor.performAuthFlow())
        case .main:
            window.rootViewController = UINavigationController(rootViewController: LaunchInstructor.performMainFlow())
        }

        UITabBar.appearance().isTranslucent = false
        self.window = window
        self.window?.makeKeyAndVisible()
        return true
    }

}

enum LaunchInstructor {
    case authorization, main
        
    static func setup() -> LaunchInstructor {
        switch (Session.isAuthorized, Session.isAuthorizationSkipped) {
        case (false, false):
            return .authorization
        case (true, true):
            return .main
        default:
            return .main
        }
    }
    
    static func performAuthFlow() -> AuthViewController {
        return AuthModuleConfigurator.configure()
    }
    
    static func performMainFlow() -> MainViewController {
        return MainModuleConfigurator.configure()
    }
}
