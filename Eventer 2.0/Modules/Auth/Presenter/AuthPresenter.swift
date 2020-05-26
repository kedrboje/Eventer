//
//  AuthPresenter.swift
//  Eventer 2.0
//
//  Created by Федор Рубченков on 18.04.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import Foundation
import KeychainSwift

protocol AuthPresenterProtocol {
    func viewLoaded()
    var onLogin: ((Credentials)->())? { get set }
    var onSkip: (()->())? { get set }
}

final class AuthPresenter: AuthPresenterProtocol {
    
    weak var view: AuthViewProtocol?
    var router: AuthRouterProtocol?
    var onLogin: ((Credentials)->())?
    var onSkip: (() -> ())?

    func viewLoaded() {
        setupCompletions()
    }
    
    private func setupCompletions() {
        onLogin = { [unowned self] credentials in
            let keychain = KeychainSwift()
            keychain.synchronizable = false
            keychain.set(credentials.username, forKey: PersistantKeys.login)
            keychain.set(credentials.password, forKey: PersistantKeys.pwd)
            self.router?.showMain()
        }
        onSkip = { [unowned self] in
            self.router?.showMain()
        }
    }
}
