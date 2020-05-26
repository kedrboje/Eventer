//
//  Constants.swift
//  Eventer 2.0
//
//  Created by Федор Рубченков on 18.04.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import Foundation

enum Storyboards: String {
    case main = "Main"
    case auth = "Auth"
    case home = "Home"
    case events = "Events"
    case tracking = "Tracking"
    case profile = "Profile"
}

// MARK:- PersistantKeys enum
enum PersistantKeys {
    
    static let token            = "kToken"
    static let isAuthorizationSkipped = "kIsAuthorizationSkipped"
    static let customerName = "kCustomerName"
    static let customerPhoneNumber = "kCustomerPhoneNumber"

    
}
