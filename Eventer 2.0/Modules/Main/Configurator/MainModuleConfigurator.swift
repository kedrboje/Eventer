//
//  MainModuleConfigurator.swift
//  Eventer 2.0
//
//  Created by Федор Рубченков on 18.04.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import Foundation

final class MainModuleConfigurator {
    
    static func configure() -> MainViewController {
        
        let view = MainViewController.controllerFromStoryboard(.main)
        view.createViewController = CreateNewEventModuleConfigurator.configure()
        view.eventsController = EventsModuleConfigurator.configure()
        view.trackingController = TrackingModuleConfigurator.configure()
        view.profileController = ProfileModuleConfigurator.configure()
        
        return view
        
    }
    
}
