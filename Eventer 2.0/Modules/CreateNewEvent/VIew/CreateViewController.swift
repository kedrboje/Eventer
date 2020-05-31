//
//  CreateNew.swift
//  Eventer 2.0
//
//  Created by Macbook Pro on 26.05.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import UIKit

protocol CreateViewProtocol: class {
    func showAlert(title: String, text: String)
    func clearFields()
}

class CreateViewController: UIViewController, ModuleTransitionable {
    
    @IBOutlet weak var nameTextField: TextField!
    @IBOutlet weak var dateTextField: TextField!
    @IBOutlet weak var timeTextField: TextField!
    @IBOutlet weak var roomTextField: TextField!
    @IBAction func createEvent(_ sender: Any) { createEvent() }
    @IBAction func tapToDismiss(_ sender: Any) { view.endEditing(true) }
    
    var presenter: CreatePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewLoaded()
        setupViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    fileprivate func setupViews() {
        nameTextField.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 0.102, green: 0.149, blue: 0.224, alpha: 1)])
        dateTextField.attributedPlaceholder = NSAttributedString(string: "Date", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 0.102, green: 0.149, blue: 0.224, alpha: 1)])
        timeTextField.attributedPlaceholder = NSAttributedString(string: "Time", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 0.102, green: 0.149, blue: 0.224, alpha: 1)])
        roomTextField.attributedPlaceholder = NSAttributedString(string: "Room", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 0.102, green: 0.149, blue: 0.224, alpha: 1)])
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
        let timePicker = UIDatePicker()
        timePicker.datePickerMode = .time
        timePicker.addTarget(self, action: #selector(timeChanged(datePicker:)), for: .valueChanged)
        timeTextField.inputView = timePicker
        dateTextField.inputView = datePicker
    }
    
    @objc fileprivate func timeChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        timeTextField.text = dateFormatter.string(from: datePicker.date)
    }
    
    @objc fileprivate func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateTextField.text = dateFormatter.string(from: datePicker.date)
    }
    
    fileprivate func createEvent() {
        guard let name = nameTextField.text, !name.isEmpty,
            let date = dateTextField.text, !date.isEmpty,
            let time = timeTextField.text, !time.isEmpty,
            let room = roomTextField.text, !room.isEmpty else {
                showAlert(title: "Warning!", text: "Incorrect data")
                return
        }
        let event = Event(name: name, date: date, room: room, time: time, id: "")
        presenter?.onCreateEvent?(event)
    }
}

extension CreateViewController: CreateViewProtocol {
    func showAlert(title: String, text: String) {
        let lert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        lert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: {_ in self.dismiss(animated: true, completion: nil)}))
        present(lert, animated: true, completion: nil)
    }
    func clearFields() {
        nameTextField.text = nil
        dateTextField.text = nil
        timeTextField.text = nil
        roomTextField.text = nil
    }
}
