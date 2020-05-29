//
//  AuthModuleConfigurator.swift
//  Eventer 2.0
//
//  Created by Федор Рубченков on 18.04.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import Foundation

class AuthModuleConfigurator {
    
    static func configure() -> AuthViewController {
        
        let view = AuthViewController.controllerFromStoryboard(.auth)
        let presenter = AuthPresenter()
        let router = AuthRouter()
        
        presenter.view = view
        presenter.router = router
        view.presenter = presenter
        router.view = view
        
        return view
    }
    
    static func configureSignUP() -> SignUpViewController {
        
        let view = SignUpViewController.controllerFromStoryboard(.signUp)
        let router = SignUpRouter()
        let presenter = SignUpPresenter()
        
        view.presenter = presenter
        presenter.view = view
        router.view = view
        
        return view
    }
    
}
