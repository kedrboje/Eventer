//
//  Models.swift
//  Eventer 2.0
//
//  Created by Macbook Pro on 26.05.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import Foundation

struct Event: Codable {
    var name: String
    var date: String
    var room: String
    var time: String
    var id: String
}

struct Animal {
    let name: String
}
