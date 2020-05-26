//
//  ProfilePresenter.swift
//  Eventer 2.0
//
//  Created by Macbook Pro on 26.05.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import Foundation
import KeychainSwift

protocol ProfilePresenterProtocol {
    func viewLoaded()
    var onLogOut: (()->Void)? { get set }
}

final class ProfilePresenter: ProfilePresenterProtocol {
    
    weak var view: ProfileViewProtocol?
    
    var onLogOut: (()->Void)?
    
    func viewLoaded() {
        loadCredentials()
        setupCompletions()
    }
    
    fileprivate func setupCompletions() {
        onLogOut = { [weak self] in
            KeychainSwift().clear()
            self?.loadCredentials()
        }
    }
    
    fileprivate func loadCredentials() {
        guard let userName = KeychainSwift().get(PersistantKeys.login) else {
            view?.updateUserInfo(firstName: nil, lastName: nil, position: nil)
            return
        }
        view?.updateUserInfo(firstName: userName, lastName: nil, position: nil)
    }
    
}
