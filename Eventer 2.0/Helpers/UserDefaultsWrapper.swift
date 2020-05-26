//
//  UserDefaultsWrapper.swift
//  Eventer 2.0
//
//  Created by Федор Рубченков on 18.04.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import Foundation

struct UserDefaultsWrapper {
    
    fileprivate static let UserDefaultsStandart = UserDefaults.standard
    
    static var isAuthorizationSkipped: Bool {
        get {
            return UserDefaultsStandart.bool(forKey: PersistantKeys.isAuthorizationSkipped)
        }
        set {
            UserDefaultsStandart.set(newValue, forKey: PersistantKeys.isAuthorizationSkipped)
            UserDefaultsStandart.synchronize()
        }
    }
    
    static var isNotFirstLaunch: Bool {
        get {
            return UserDefaultsStandart.bool(forKey: PersistantKeys.isNotFirstLaunch)
        }
        set {
            UserDefaultsStandart.set(newValue, forKey: PersistantKeys.isNotFirstLaunch)
            UserDefaultsStandart.synchronize()
        }
    }
    
}
