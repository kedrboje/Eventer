//
//  AppDelegate.swift
//  Eventer 2.0
//
//  Created by Федор Рубченков on 31.03.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var reference: DatabaseReference!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        reference = Database.database().reference()
        let window = UIWindow()
        let app = UITabBar.appearance()
        app.barTintColor = #colorLiteral(red: 0.87964499, green: 0.8826124072, blue: 0.873254478, alpha: 1)
        app.isTranslucent = false
        app.unselectedItemTintColor = #colorLiteral(red: 0.1336047053, green: 0.2007030547, blue: 0.2882668376, alpha: 1)
        switch LaunchInstructor.setup() {
        case .authorization:
            window.rootViewController = UINavigationController(rootViewController: LaunchInstructor.performAuthFlow())
        case .main:
            window.rootViewController = UINavigationController(rootViewController: LaunchInstructor.performMainFlow())
        }
        
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
        case (false, true):
            return .authorization
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

extension AppDelegate {
    static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    var rootViewController: UIViewController {
        get { return window!.rootViewController as! MainViewController }
        set { window!.rootViewController = newValue }
    }
}
