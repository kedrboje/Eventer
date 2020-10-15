//
//  TrackingInitialPresenter.swift
//  Eventer 2.0
//
//  Created by Macbook Pro on 14.10.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import CodableFirebase

protocol TrackingInitialProtocol {
    func viewLoaded()
    var processTracking: ((Int)->())? { get set }
}

final class TrackingInitialPresenter: TrackingInitialProtocol {
    
    weak var view: TrackingInitialViewProtocol!
    var router: TrackingRouterProtocol!
    var processTracking: ((Int) -> ())?
    
    private var database: DatabaseReference { return Database.database().reference() }
    
    func viewLoaded() {
        setupCompletions()
    }
    
}

private extension TrackingInitialPresenter {
    
    func setupCompletions() {
        processTracking = { [weak self] roomNum in
            guard let self = self else { return }
//            self.database.child("events").observeSingleEvent(of: .value) { (snap) in
//                guard let result = snap.value else { return }
//                guard let decoded = try? FirebaseDecoder().decode(EventWrapped.self, from: snap) else { return }
//                if decoded.events.contains(where: { event -> Bool in
//                    Int(event.room.roomNumber) == roomNum
//                }) {
//                    DispatchQueue.main.async {
//                        self.router.showTracking(CGFloat(roomNum))
//                    }
//                } else {
//                    DispatchQueue.main.async {
//                        self.view?.showWrongRoomAlert()
//                    }
//                }
//            }
            self.router.showTracking(CGFloat(5.0)) // TODO: - testValue
        }
    }
    
}
