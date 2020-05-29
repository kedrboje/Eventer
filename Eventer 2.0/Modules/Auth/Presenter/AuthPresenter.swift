//
//  AuthPresenter.swift
//  Eventer 2.0
//
//  Created by Федор Рубченков on 18.04.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import Foundation
import KeychainSwift
import Firebase

protocol AuthPresenterProtocol {
    func viewLoaded()
    var onLogin:  ((Credentials)->())? { get set }
    var onSignUp: (()->())? { get set }
}

final class AuthPresenter: AuthPresenterProtocol {
    
    weak var view: AuthViewProtocol?
    var router: AuthRouterProtocol?
    var onLogin: ((Credentials)->())?
    var onSignUp: (()->())?

    func viewLoaded() {
        setupCompletions()
    }
    
    private func setupCompletions() {
        onLogin = { [unowned self] credentials in
            Auth.auth().signIn(withEmail: credentials.email, password: credentials.password) { [weak self] (res, error) in
                if let e = error {
                    self?.view?.showAlert(text: e.localizedDescription)
                } else {
                    let keychain = KeychainSwift()
                    keychain.synchronizable = false
                    keychain.set(credentials.email, forKey: PersistantKeys.email)
                    keychain.set(credentials.password, forKey: PersistantKeys.pwd)
                    self?.router?.showMain()
                }
            }
        }
        onSignUp = { [unowned self] in
            self.router?.showSignUp()
        }
    }
}
