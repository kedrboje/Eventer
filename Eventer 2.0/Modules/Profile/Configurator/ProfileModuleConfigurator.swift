//
//  ProfileModuleConfigurator.swift
//  Eventer 2.0
//
//  Created by Федор Рубченков on 18.04.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import Foundation

final class ProfileModuleConfigurator {
    
    static func configure() -> ProfileViewController {
        
        let view = ProfileViewController.controllerFromStoryboard(.profile)
        let presenter = ProfilePresenter()
        
        presenter.view = view
        view.presenter = presenter
        
        return view
    }
    
}
