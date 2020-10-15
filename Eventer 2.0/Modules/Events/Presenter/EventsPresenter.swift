//
//  EventsPresenter.swift
//  Eventer 2.0
//
//  Created by Macbook Pro on 26.05.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import Foundation
import Firebase
import CodableFirebase

protocol EventsPresenterProtocol {
    func viewLoaded()
    var cells:          [EventCell]?       { get set }
    var cellData:       [Event]?           { get set }
    var onEvent:        ((Event) -> Void)? { get set }
}

final class EventsPresenter: EventsPresenterProtocol {
    
    weak var view: EventsViewProtocol?
    var router:    EventsRouter?
    var cellData:  [Event]?
    var cells:     [EventCell]?
    var onEvent:   ((Event) -> Void)?
    
    func viewLoaded() {
        setupObserver()
        setupCompletions()
        Database.database().reference().observeSingleEvent(of: .value) { [weak self] snap in
            guard let value = snap.value as? [String : AnyObject], snap.exists() else { return }
            self?.cellData = []
            if let events = value["events"] as? [String:AnyObject] {
                events.forEach {
                    do {
                        let model = try FirebaseDecoder().decode(Event.self, from: $0.value)
                        self?.cellData?.append(model)
                    } catch(let e) { print(e) }
                }
                self?.view?.update()
            }
        }
    }
    
    fileprivate func setupObserver() {
        Database.database().reference().observe(.childAdded) { [weak self] snap in
            guard let value = snap.value as? [String : AnyObject], snap.exists() else { return }
            self?.cellData = []
            if let events = value["events"] as? [String:AnyObject] {
                events.forEach {
                    do {
                        let model = try FirebaseDecoder().decode(Event.self, from: $0.value)
                        self?.cellData?.append(model)
                    } catch(let e) { print(e) }
                }
                self?.view?.update()
            }
        }
    }
    
    fileprivate func setupCompletions() {
        onEvent = { [weak self] event in
            self?.router?.showDetail(event: event)
        }
    }
    
}
