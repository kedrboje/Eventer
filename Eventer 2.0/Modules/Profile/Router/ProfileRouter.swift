//
//  ProfileRouter.swift
//  Eventer 2.0
//
//  Created by Macbook Pro on 27.05.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import Foundation

protocol ProfileRouterProtocol {
    func showAuth()
}


final class ProfileRouter: ProfileRouterProtocol {
    
    weak var view: ModuleTransitionable?
    
    func showAuth() {
        AppDelegate.shared.rootViewController = AuthModuleConfigurator.configure()
    }
    
}
