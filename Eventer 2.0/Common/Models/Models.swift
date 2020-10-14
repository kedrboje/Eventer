//
//  Models.swift
//  Eventer 2.0
//
//  Created by Macbook Pro on 26.05.2020.
//  Copyright © 2020 Федор Рубченков. All rights reserved.
//

import Foundation

struct EventWrapped: Codable {
    var events: [Event]
}

struct Event: Codable {
    var name: String
    var date: String
    var room: Room
    var startTime: String
    var endTime: String
    var id: String
}

struct Badge: Codable {
    var badgeName: String
    var rssiOne: Double
    var rssiTwo: Double
    var rssiThree: Double
    var distanceOne: Double
    var distanceTwo: Double
    var distanceThree: Double
    
    enum CodingKeys: String, CodingKey {
        case badgeName = "BadgeName"
        case rssiOne = "RSSI1"
        case rssiTwo = "RSSI2"
        case rssiThree = "RSSI3"
        case distanceOne = "distance_1"
        case distanceTwo = "distance_2"
        case distanceThree = "distance_3"
    }
}

struct Room: Codable {
    var roomNumber: Int
    var roomWallValue: Double
}
