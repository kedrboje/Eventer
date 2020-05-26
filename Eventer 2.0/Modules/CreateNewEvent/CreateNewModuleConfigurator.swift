//
//  CreateNewModuleConfigurator.swift
//  Eventer 2.0
//
//  Created by Macbook Pro on 26.05.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import Foundation


final class CreateNewEventModuleConfigurator {
    
    static func configure() -> CreateViewController {
        
        let view = CreateViewController.controllerFromStoryboard(.create)
//        let presenter = EventsPresenter()
//        let router = EventsRouter()
        
//        presenter.view = view
//        presenter.router = router
//        router.view = view
//        view.presenter = presenter
        
        return view
    }
    
}
