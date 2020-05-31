//
//  DetailEventPresenter.swift
//  Eventer 2.0
//
//  Created by Macbook Pro on 31.05.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import Foundation
import Firebase

protocol DetailEventPresenterProtocol {
    func viewloaded()
    var onDelete:  (() -> Void)?   { get set }
}

final class DetailEventsPresenter: DetailEventPresenterProtocol {
    
    weak var view: DetailEventsViewProtocol?
    var router:  DetailEventsRouter?
    var onDelete: (() -> Void)?
    var event: Event?
    
    func viewloaded() {
        view?.configure(with: event!)
        setupCompletions()
    }
    
    private func setupCompletions() {
        onDelete = { [weak self] in
            guard let e = self?.event else { return }
            Database.database().reference().child("events").child(e.id).removeValue { (err, _) in
                if let error = err {
                    self?.view?.showAlert(title: "Warning", text: error.localizedDescription, completion: nil)
                } else {
                    self?.view?.showAlert(title: "Success", text: "Event successfully deleted", completion: { [weak self] _ in self?.router?.dismiss()})
                }
            }
        }
    }
}
