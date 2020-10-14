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
    @IBOutlet weak var startTimeTextField: TextField!
    @IBOutlet weak var endTimeTextField: TextField!
    @IBOutlet weak var roomNumberTextField: TextField!
    @IBOutlet weak var roomWallWidth: TextField!
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
        startTimeTextField.attributedPlaceholder = NSAttributedString(string: "Time", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 0.102, green: 0.149, blue: 0.224, alpha: 1)])
        roomNumberTextField.attributedPlaceholder = NSAttributedString(string: "Room", attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 0.102, green: 0.149, blue: 0.224, alpha: 1)])
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
        let timePicker = UIDatePicker()
        timePicker.datePickerMode = .time
        timePicker.addTarget(self, action: #selector(timeChanged(datePicker:)), for: .valueChanged)
        startTimeTextField.inputView = timePicker
        dateTextField.inputView = datePicker
    }
    
    @objc fileprivate func timeChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        startTimeTextField.text = dateFormatter.string(from: datePicker.date)
    }
    
    @objc fileprivate func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateTextField.text = dateFormatter.string(from: datePicker.date)
    }
    
    fileprivate func createEvent() {
        guard let name = nameTextField.text, !name.isEmpty,
            let date = dateTextField.text, !date.isEmpty,
            let time = startTimeTextField.text, !time.isEmpty,
            let roomNumber = roomNumberTextField.text, !roomNumber.isEmpty,
            let roomWidth = roomWallWidth.text, !roomWidth.isEmpty,
            let endTome = endTimeTextField.text, !endTome.isEmpty else {
                showAlert(title: "Warning!", text: "Incorrect data")
                return
        }
        guard let roomNum = Int(roomNumber) else {
            showAlert(title: "Waring", text: "Incorrect number of room")
            return
        }
        guard let roomValue = Double(roomWidth) else {
            showAlert(title: "Warning", text: "Incorrect width of room")
            return
        }
        let roomModel = Room(roomNumber: roomNum, roomWallValue: roomValue)
        let event = Event(name: name, date: date, room: roomModel, startTime: time, endTime: endTome, id: "")
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
        startTimeTextField.text = nil
        roomNumberTextField.text = nil
    }
}
