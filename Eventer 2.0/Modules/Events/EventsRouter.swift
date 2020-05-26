//
//  Router.swift
//  Eventer 2.0
//
//  Created by Macbook Pro on 26.05.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import Foundation

protocol EventsRouterProtocol {
    
}


final class EventsRouter: EventsRouterProtocol {
    
    weak var view: ModuleTransitionable?
    var configurator: EventsModuleConfigurator?
    
    
}
