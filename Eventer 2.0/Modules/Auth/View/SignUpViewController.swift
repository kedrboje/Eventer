//
//  SignUpViewController.swift
//  Eventer 2.0
//
//  Created by Macbook Pro on 27.05.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import UIKit

protocol SignUpViewProtocol: class {
    func showAlert(text: String)
}

class SignUpViewController: UIViewController, ModuleTransitionable, SignUpViewProtocol {

    @IBOutlet weak var loginTextField: TextField!
    @IBOutlet weak var emailTextField: TextField!
    @IBOutlet weak var pwdTextField: TextField!
    @IBAction func tapToDismiss(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func SignUpDidPressed(_ sender: Any) {
        signUp()
    }
    
    var presenter: SignUpPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewLoaded()
        setupViews()
    }
    
    func showAlert(text: String) {
        let lert = UIAlertController(title: "Attention!", message: text, preferredStyle: .alert)
        lert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(lert, animated: true, completion: nil)
    }

    private func setupViews() {
        loginTextField.attributedPlaceholder = NSAttributedString(string: "Login", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 0.102, green: 0.149, blue: 0.224, alpha: 1)])
        pwdTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 0.102, green: 0.149, blue: 0.224, alpha: 1)])
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 0.102, green: 0.149, blue: 0.224, alpha: 1)])
        loginTextField.delegate = self
        pwdTextField.delegate = self
        emailTextField.delegate = self
    }
    
    private func signUp() {
        guard let email = emailTextField.text,
            let login = loginTextField.text,
            let pwd = pwdTextField.text,
            !email.isEmpty, !login.isEmpty, !pwd.isEmpty else {
                showAlert(text: "Incorrect login or password")
                return
        }
        presenter?.onSignUp?(email, login, pwd)
    }
}

extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        signUp()
        return true
    }
}
