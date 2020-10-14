//
//  CreatePresenter.swift
//  Eventer 2.0
//
//  Created by Macbook Pro on 31.05.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import Foundation
import Firebase

protocol CreatePresenterProtocol {
    func viewLoaded()
    var onCreateEvent:   ((Event) -> Void)?  { get set }
}

final class CreatePresenter: CreatePresenterProtocol {
    
    weak var view: CreateViewProtocol?
    var onCreateEvent:   ((Event) -> Void)?
    
    func viewLoaded() {
        setupCompletions()
    }
    
    private func setupCompletions() {
        onCreateEvent = { [weak self] event in
            let id = UUID().uuidString
            Database.database().reference().child("events").child(id).setValue(["name":event.name, "date":event.date, "startTime":event.startTime, "room":event.room, "id": id])
            self?.view?.showAlert(title: "Success", text: "Event successfully created")
            self?.view?.clearFields()
        }
    }
    
}
