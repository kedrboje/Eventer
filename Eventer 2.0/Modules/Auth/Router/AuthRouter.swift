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
    func showSignUp()
}

final class AuthRouter: AuthRouterProtocol {
    
    weak var view: ModuleTransitionable?
    
    func showMain() {
        view?.setRoot(module: LaunchInstructor.performMainFlow(), animated: true)
    }
    func showSignUp() {
//        view?.push(module: AuthModuleConfigurator.configureSignUP(), animated: true)
        view?.presentModule(AuthModuleConfigurator.configureSignUP(), animated: true, completion: nil)
    }
}
