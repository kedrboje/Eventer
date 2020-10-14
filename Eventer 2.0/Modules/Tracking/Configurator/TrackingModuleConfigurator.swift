//
//  TrackingModuleConfigurator.swift
//  Eventer 2.0
//
//  Created by Федор Рубченков on 18.04.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import Foundation
import UIKit

final class TrackingModuleConfigurator {
    
    static func configureTracking(_ x:CGFloat) -> TrackingViewController {
        
        let view = TrackingViewController.controllerFromStoryboard(.tracking)
        let presenter = TrackingPresenter()
        let router = TrackingRouter()
        
        view.presenter = presenter
        view.xValue = x
        presenter.view = view
        presenter.router = router
        router.view = view

        return view
    }
    
    static func configureInitialTracking() -> TrackingInitialViewController {
        
        let view = TrackingInitialViewController.controllerFromStoryboard(.tracking)
        let router = TrackingRouter()
        let presenter = TrackingInitialPresenter()
        view.presenter = presenter
        presenter.router = router
        router.view = view
        presenter.view = view
        
        return view
    }
    
}
