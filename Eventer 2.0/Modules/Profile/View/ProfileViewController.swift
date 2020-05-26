//
//  ProfileViewController.swift
//  Eventer 2.0
//
//  Created by Федор Рубченков on 18.04.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import UIKit

protocol ProfileViewProtocol: class {
    func updateUserInfo(firstName: String?, lastName: String?, position: String?)
}

class ProfileViewController: UIViewController, ProfileViewProtocol {

    var presenter: ProfilePresenterProtocol?
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBAction func logOutPressed(_ sender: Any) {
        presenter?.onLogOut?()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewLoaded()
    }
    
    func updateUserInfo(firstName: String?, lastName: String?, position: String?) {
        firstNameLabel.text = firstName
        lastNameLabel.text = lastName
        positionLabel.text = position
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
