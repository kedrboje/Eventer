//
//  Session.swift
//  Eventer 2.0
//
//  Created by Федор Рубченков on 18.04.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import Foundation
import KeychainSwift

typealias Credentials = (username: String, password: String)

struct Session {
    
    static var isAuthorized: Bool {
        let keychain = KeychainSwift()
        keychain.synchronizable = false
        if let _ = keychain.get(PersistantKeys.pwd), let _ = keychain.get(PersistantKeys.login) {
            return true
        }
        return false
    }
    
    static var isAuthorizationSkipped: Bool {
        get {
            return UserDefaultsWrapper.isAuthorizationSkipped
        }
        set {
            UserDefaultsWrapper.isAuthorizationSkipped = newValue
        }
    }
    
    static var isNotFirstLaunch: Bool {
        get { return UserDefaultsWrapper.isNotFirstLaunch }
        set { UserDefaultsWrapper.isNotFirstLaunch = newValue }
    }

}
