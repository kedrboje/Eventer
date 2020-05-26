//
//  ViewController.swift
//  Eventer
//
//  Created by Федор Рубченков on 14.03.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import UIKit

protocol AuthViewProtocol: class {
    
}

class AuthViewController: UIViewController, ModuleTransitionable, AuthViewProtocol {
    
    var presenter: AuthPresenterProtocol?

    @IBOutlet weak var loginTextField: TextField!
    @IBOutlet weak var passwordTextField: TextField!
    @IBAction func loginButtonPressed(_ sender: Any) {
//        TODO: for test
//        presenter?.onLogin?()
        presenter?.onSkip?()
    }
    @IBAction func signUpButtonPressed(_ sender: Any) {
        presenter?.onSkip?()
    }
    @IBAction func tapToHideKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewLoaded()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    private func setupViews() {
        loginTextField.attributedPlaceholder = NSAttributedString(string: "Login", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 0.102, green: 0.149, blue: 0.224, alpha: 1)])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 0.102, green: 0.149, blue: 0.224, alpha: 1)])
    }
    
}

