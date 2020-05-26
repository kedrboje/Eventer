//
//  CreateNew.swift
//  Eventer 2.0
//
//  Created by Macbook Pro on 26.05.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import UIKit

protocol CreateViewProtocol {
    
}

class CreateViewController: UIViewController, ModuleTransitionable, CreateViewProtocol {

//    var presenter: ?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}
