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
    
    static var token: String? {
        get {
            return UserDefaultsStandart.string(forKey: PersistantKeys.token)
        }
        set {
            UserDefaultsStandart.set(newValue, forKey: PersistantKeys.token)
            UserDefaultsStandart.synchronize()
        }
    }
    
    static var isAuthorizationSkipped: Bool {
        get {
            return UserDefaultsStandart.bool(forKey: PersistantKeys.isAuthorizationSkipped)
        }
        set {
            UserDefaultsStandart.set(newValue, forKey: PersistantKeys.isAuthorizationSkipped)
            UserDefaultsStandart.synchronize()
        }
    }
    
}
