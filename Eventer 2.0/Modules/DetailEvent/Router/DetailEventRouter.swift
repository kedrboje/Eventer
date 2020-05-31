//
//  DetailEventRouter.swift
//  Eventer 2.0
//
//  Created by Macbook Pro on 31.05.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import Foundation

protocol DetailEventsRouterProtocol {
    func dismiss()
}

final class DetailEventsRouter: DetailEventsRouterProtocol {
    
    weak var view: ModuleTransitionable?
    
    func dismiss() {
        view?.popToRoot(animated: true)
    }
    
}
