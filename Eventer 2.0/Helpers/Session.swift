//
//  Session.swift
//  Eventer 2.0
//
//  Created by Федор Рубченков on 18.04.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import Foundation

typealias Credentials = (username: String, password: String)

struct Session {
    static var isAuthorized: Bool {
        return UserDefaultsWrapper.token != nil
    }
    
    static var isAuthorizationSkipped: Bool {
        get {
            return UserDefaultsWrapper.isAuthorizationSkipped
        }
        set {
            UserDefaultsWrapper.isAuthorizationSkipped = newValue
        }
    }

}
