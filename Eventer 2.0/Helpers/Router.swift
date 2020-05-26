//
//  Router.swift
//  Eventer 2.0
//
//  Created by Федор Рубченков on 18.04.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import UIKit

protocol ModuleTransitionable: class {

    func showModule(_ module: UIViewController)

    func dismissView(animated: Bool, completion: (() -> Void)?)

    func presentModule(_ module: UIViewController, animated: Bool, completion: (() -> Void)?)

    func pop(animated: Bool)

    func popToRoot(animated: Bool)

    func push(module: UIViewController, animated: Bool)

    func push(module: UIViewController, animated: Bool, hideTabBar: Bool)
    
    func setRoot(module: UIViewController, animated: Bool)
}

extension ModuleTransitionable where Self: UIViewController {

    func showModule(_ module: UIViewController) {
        self.show(module, sender: nil)
    }

    func dismissView(animated: Bool, completion: (() -> Void)?) {
        self.dismiss(animated: animated, completion: completion)
    }

    func presentModule(_ module: UIViewController, animated: Bool, completion: (() -> Void)?) {
        self.present(module, animated: animated, completion: completion)
    }

    func pop(animated: Bool) {
        self.navigationController?.popViewController(animated: animated)
    }

    func popToRoot(animated: Bool) {
        self.navigationController?.popToRootViewController(animated: animated)
    }

    func push(module: UIViewController, animated: Bool) {
        self.navigationController?.pushViewController(module, animated: animated)
    }

    func push(module: UIViewController, animated: Bool, hideTabBar: Bool = false) {
        module.hidesBottomBarWhenPushed = hideTabBar
        push(module: module, animated: animated)
    }

    func setRoot(module: UIViewController, animated: Bool) {
        self.navigationController?.setViewControllers([module], animated: true)
    }
}
