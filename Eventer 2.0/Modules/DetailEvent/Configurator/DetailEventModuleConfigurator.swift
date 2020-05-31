//
//  DetailEventModuleConfigurator.swift
//  Eventer 2.0
//
//  Created by Macbook Pro on 31.05.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import Foundation

final class DetailEventModuleConfigurator {
    
    static func configure(with event: Event) -> DetailEvents {
        let view = DetailEvents.controllerFromStoryboard(.detail)
        let presenter = DetailEventsPresenter()
        let router = DetailEventsRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.event = event
        presenter.router = router
        router.view = view
        
        return view
    }
    
}
