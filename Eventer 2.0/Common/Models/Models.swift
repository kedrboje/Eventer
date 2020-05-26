//
//  Models.swift
//  Eventer 2.0
//
//  Created by Macbook Pro on 26.05.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import Foundation

struct Event: Codable {
    var title: String
    var data: String
    var room: String
    var time: String
}
