//
//  EventsModuleConfigurator.swift
//  Eventer 2.0
//
//  Created by Федор Рубченков on 18.04.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import Foundation

final class EventsModuleConfigurator {
    
    static func configure() -> EventsViewController {
        
        let view = EventsViewController.controllerFromStoryboard(.events)
        let presenter = EventsPresenter()
        let router = EventsRouter()
        
        presenter.view = view
        presenter.router = router
        router.view = view
        view.presenter = presenter
        
        return view
    }
    
}
