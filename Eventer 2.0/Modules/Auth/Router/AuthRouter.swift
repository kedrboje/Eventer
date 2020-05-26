//
//  AuthRouter.swift
//  Eventer 2.0
//
//  Created by Федор Рубченков on 18.04.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import Foundation

protocol AuthRouterProtocol {
    func showMain()
}

final class AuthRouter: AuthRouterProtocol {
    
    weak var view: ModuleTransitionable?
    
    func showMain() {
        view?.setRoot(module: LaunchInstructor.performMainFlow(), animated: true)
    }
    
}
