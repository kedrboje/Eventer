//
//  HomeModuleConfigurator.swift
//  Eventer 2.0
//
//  Created by Федор Рубченков on 18.04.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import Foundation

final class HomeModuleConfigurator {
    
    static func configure() -> HomeViewController {
        let view = HomeViewController.controllerFromStoryboard(.home)
        
        return view
    }
    
}
