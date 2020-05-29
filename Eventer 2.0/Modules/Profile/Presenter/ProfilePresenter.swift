//
//  ProfilePresenter.swift
//  Eventer 2.0
//
//  Created by Macbook Pro on 26.05.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import Foundation
import KeychainSwift
import Firebase

protocol ProfilePresenterProtocol {
    func viewLoaded()
    var onLogOut: (()->Void)? { get set }
}

final class ProfilePresenter: ProfilePresenterProtocol {
    
    weak var view: ProfileViewProtocol?
    var router: ProfileRouterProtocol?
    
    var onLogOut: (()->Void)?
    
    func viewLoaded() {
        loadCredentials()
        setupCompletions()
    }
    
    fileprivate func setupCompletions() {
        onLogOut = { [weak self] in
            try? Auth.auth().signOut()
            KeychainSwift().clear()
            self?.router?.showAuth()
        }
    }
    
    fileprivate func loadCredentials() {
        guard let userName = KeychainSwift().get(PersistantKeys.email) else {
            view?.updateUserInfo(firstName: nil, lastName: nil, position: nil)
            return
        }
        view?.updateUserInfo(firstName: userName, lastName: nil, position: nil)
    }
    
}
