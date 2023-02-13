//
//  UserDataModel.swift
//  Waterly App
//
//  Created by Olegio on 06.02.2023.
//

import Foundation

typealias UserGender = UserDataModel.UserGender
typealias UserActivity = UserDataModel.UserActivity

struct UserDataModel: Codable {
    let id: UUID
    let name: String
    let gender: UserGender
    let age: String
    let height: String
    let weight: String
    let activity: UserActivity
}

extension UserDataModel {
    enum UserGender: Codable {
        case male
        case female
    }
    
    enum UserActivity: Codable {
        case low
        case medium
        case high
    }
}
