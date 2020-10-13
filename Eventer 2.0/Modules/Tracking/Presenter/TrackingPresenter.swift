//
//  TrackingPresenter.swift
//  Eventer 2.0
//
//  Created by Macbook Pro on 13.10.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import Foundation
import Firebase
import CodableFirebase

protocol TrackingPresenterProtocol {
    func viewLoaded()
}

final class TrackingPresenter: TrackingPresenterProtocol {

    weak var view: TrackingViewProtocol?
    var badge: Badge?
    
    private var database: DatabaseReference { return Database.database().reference() }
    
    func viewLoaded() {
        setupObserver()
    }
    
}

// MARK: - Private Methods
private extension TrackingPresenter {
    
    func setupObserver() {
        database.child("badges").child("1 badge").observe(.value) { [weak self] (snap) in
            guard let result = snap.value else { return }
            guard let decoded = try? FirebaseDecoder().decode(Badge.self, from: result) else { return }
            DispatchQueue.main.async {
                self?.view?.proccessBadgePosition(badge: decoded)
            }
        }
    }
    
}
