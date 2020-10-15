//
//  TrackingRouter.swift
//  Eventer 2.0
//
//  Created by Macbook Pro on 14.10.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import Foundation
import UIKit

protocol TrackingRouterProtocol {
    func showTracking(_ x: CGFloat)
}

final class TrackingRouter: TrackingRouterProtocol {
    
    weak var view: ModuleTransitionable!
    
    func showTracking(_ x: CGFloat) {
        view?.push(module: TrackingModuleConfigurator.configureTracking(x), animated: true)
    }
    
}
