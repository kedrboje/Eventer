//
//  EventsPresenter.swift
//  Eventer 2.0
//
//  Created by Macbook Pro on 26.05.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import Foundation

protocol EventsPresenterProtocol {
    func viewLoaded()
    var cells:          [EventCell]? { get set }
    var cellData:       [Event]?     { get set }
}

final class EventsPresenter: EventsPresenterProtocol {
    
    weak var view: EventsViewProtocol?
    var router:    EventsRouter?
    var cellData:  [Event]?
    var cells:     [EventCell]?
    
    func viewLoaded() {
        let event = Event(title: "Event", data: "March 5", room: "room 512", time: "3 p.m.")
        cellData = [ event, event, event, event ]
    }
    
    fileprivate func fetchEventsData() {
        
    }
    
}
