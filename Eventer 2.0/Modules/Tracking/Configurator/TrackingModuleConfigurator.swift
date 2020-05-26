//
//  TrackingModuleConfigurator.swift
//  Eventer 2.0
//
//  Created by Федор Рубченков on 18.04.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import Foundation

final class TrackingModuleConfigurator {
    
    static func configure() -> TrackingViewController {
        
        let view = TrackingViewController.controllerFromStoryboard(.tracking)
        
        return view
    }
    
}
