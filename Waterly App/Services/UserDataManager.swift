//
//  UserDataManager.swift
//  Waterly App
//
//  Created by Olegio on 06.02.2023.
//

import Foundation

protocol UserDataManagerProtocol {
    func saveUserData(_ userData: UserDataModel)
    func getUserData(_ userData: UserDataModel) -> UserDataModel?
}

class UserDataManager: UserDataManagerProtocol {
    private let userDefaults = UserDefaults.standard
    
    func saveUserData(_ userData: UserDataModel) {
        userDefaults.set(userData, forKey: "\(userData.id)")
    }
    
    func getUserData(_ userData: UserDataModel) -> UserDataModel? {
        return userDefaults.object(forKey: "\(userData.id)") == nil ?
        nil : userDefaults.object(forKey: "\(userData.id)") as? UserDataModel
    }
}
