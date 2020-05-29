//
//  ViewController.swift
//  Eventer
//
//  Created by Федор Рубченков on 14.03.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import UIKit

protocol AuthViewProtocol: class {
    func showAlert(text: String)
}

class AuthViewController: UIViewController, ModuleTransitionable, AuthViewProtocol {
    
    var presenter: AuthPresenterProtocol?
    var credentials: Credentials?

    @IBOutlet weak var email: TextField!
    @IBOutlet weak var passwordTextField: TextField!
    @IBAction func loginButtonPressed(_ sender: Any) {
        auth()
    }
    @IBAction func signUpButtonPressed(_ sender: Any) {
        presenter?.onSignUp?()
    }
    @IBAction func tapToHideKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
    func showAlert(text: String) {
        let lert = UIAlertController(title: "Attention!", message: text, preferredStyle: .alert)
        lert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: {_ in self.dismiss(animated: true, completion: nil)}))
        present(lert, animated: true, completion: nil)
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
        email.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 0.102, green: 0.149, blue: 0.224, alpha: 1)])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 0.102, green: 0.149, blue: 0.224, alpha: 1)])
        email.delegate = self
        passwordTextField.delegate = self
    }
    
    func auth() {
        guard let email = email.text,
            let pwd = passwordTextField.text,
            !email.isEmpty,
            !pwd.isEmpty else {
            let alert = UIAlertController(title: "Warning", message: "Incorrect login or password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        credentials = Credentials(email, pwd)
        presenter?.onLogin?(credentials!)
    }
    
}

extension AuthViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        auth()
        return true
    }
}
