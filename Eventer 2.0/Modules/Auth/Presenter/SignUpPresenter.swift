//
//  SignUpPresenter.swift
//  Eventer 2.0
//
//  Created by Macbook Pro on 27.05.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import Foundation
import Firebase

protocol SignUpPresenterProtocol {
    func viewLoaded()
    var onSignUp: ((String,String,String) -> Void)?   { get set }
}

final class SignUpPresenter: SignUpPresenterProtocol {
    
    weak var view: SignUpViewProtocol?
    var router: SignUpRouterProtocol?
    var onSignUp: ((String,String,String) -> Void)?
    
    func viewLoaded() {
        setupCompletions()
    }
    
    private func setupCompletions() {
        onSignUp = { [unowned self] email, login, pwd in
            Auth.auth().createUser(withEmail: email, password: pwd) { [weak self] (result, error) in
                guard let res = result else {
                    self?.view?.showAlert(text: error!.localizedDescription)
                    return
                }
                let ref = Database.database().reference().child("users")
                ref.child(res.user.uid).updateChildValues(["email":email, "login":login, "pass":pwd])
                self?.view?.showAlert(text: "User successfully created")
            }
        }
    }
    
}
