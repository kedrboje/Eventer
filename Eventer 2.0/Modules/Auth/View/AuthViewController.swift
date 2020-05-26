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
    var credentials: Credentials?

    @IBOutlet weak var loginTextField: TextField!
    @IBOutlet weak var passwordTextField: TextField!
    @IBAction func loginButtonPressed(_ sender: Any) {
        guard let login = loginTextField.text,
            let pwd = passwordTextField.text,
            !login.isEmpty,
            !pwd.isEmpty else {
            let alert = UIAlertController(title: "Warning", message: "Incorrect login or password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        credentials = Credentials(login, pwd)
        presenter?.onLogin?(credentials!)
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

    private func setupViews() {
        loginTextField.attributedPlaceholder = NSAttributedString(string: "Login", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 0.102, green: 0.149, blue: 0.224, alpha: 1)])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 0.102, green: 0.149, blue: 0.224, alpha: 1)])
    }
    
}

