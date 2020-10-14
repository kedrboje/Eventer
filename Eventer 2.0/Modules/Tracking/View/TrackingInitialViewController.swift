//
//  TrackingInitialViewController.swift
//  Eventer 2.0
//
//  Created by Macbook Pro on 14.10.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import UIKit

protocol TrackingInitialViewProtocol: class {
    func showWrongRoomAlert()
}

final class TrackingInitialViewController: UIViewController, ModuleTransitionable {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var roomTextField: TextField!
    @IBAction func showTracking(_ sender: UIButton) {
        guard let room = roomTextField.text, !room.isEmpty, let value = Int(room) else {
            showWrongRoomAlert()
            return
        }
        presenter?.processTracking?(value)
    }
    @IBAction func tapToDismissKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
    var presenter: TrackingInitialProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventrSetup()
        presenter.viewLoaded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    func showAlert(title: String, text: String, completion: ((UIAlertAction)->Void)?) {
        let lert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        lert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: completion ?? {_ in self.dismiss(animated: true, completion: nil)}))
        present(lert, animated: true, completion: nil)
    }
}

// MARK: - Private Methods
private extension TrackingInitialViewController {
    func eventrSetup() {
        titleLabel.text = "Enter number of room"
    }
    
}

// MARK: - TrackingInitialViewProtocol
extension TrackingInitialViewController: TrackingInitialViewProtocol {
    func showWrongRoomAlert() {
        showAlert(title: "Warning", text: "Room doesn't exist", completion: nil)
    }
}

