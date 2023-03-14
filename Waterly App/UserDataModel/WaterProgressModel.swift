//
//  WaterProgressModel.swift
//  Waterly App
//
//  Created by Olegio on 16.02.2023.
//

import Foundation

struct WaterProgress: Codable {
    var progressArray: [WaterCapacity]
}

struct WaterCapacity: Codable {
    let capacity: Int
    let date: Date?
}
