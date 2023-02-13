//
//  UserDataManager.swift
//  Waterly App
//
//  Created by Olegio on 06.02.2023.
//

import Foundation

private let dataKey = "userData"

protocol UserDataManagerProtocol {
    init(encoder: JSONEncoder, decoder: JSONDecoder)
    func saveUserData(_ userData: UserDataModel)
    func getUserData(completion: @escaping (Result<UserDataModel, Error>) -> Void)
    func removeUserData()
    func saveWaterRate(_ value: Int?, for userID: UUID)
    func getWaterRate(for key: String?) -> Int?
}

enum DataManagerError: Error {
    case invalidKey
}

class UserDataManager: UserDataManagerProtocol {
    private let userDefaults = UserDefaults.standard
    static let shared = UserDataManager()
    private let encoder: JSONEncoder
    private let decoder: JSONDecoder
    private var user: UserDataModel? = nil
    
    required init(encoder: JSONEncoder = .init(), decoder: JSONDecoder = .init()) {
        self.encoder = encoder
        self.decoder = decoder
    }
    
    func saveUserData(_ userData: UserDataModel) {
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            do {
                let data = try self.encoder.encode(userData)
                self.userDefaults.set(data, forKey: dataKey)
            } catch let error {
                print(error)
            }
        }
    }
    
    func getUserData(completion: @escaping (Result<UserDataModel, Error>) -> Void) {
        guard let data = userDefaults.data(forKey: dataKey) else {
            completion(.failure(DataManagerError.invalidKey))
            return
        }
        do {
            let userPossibleData = try self.decoder.decode(UserDataModel.self, from: data)
            print("PossibleUserDATA: \(userPossibleData)")
            completion(.success(userPossibleData))
        } catch {
            completion(.failure(error))
            print(error)
        }
    }
    
    func removeUserData() {
        userDefaults.removeObject(forKey: dataKey)
    }
    
    func saveWaterRate(_ value: Int?, for userID: UUID) {
        userDefaults.set(value, forKey: "\(userID)")
    }
    
    func getWaterRate(for key: String?) -> Int? {
        guard let key = key else { return nil }
        return userDefaults.object(forKey: key) == nil ?
        nil : userDefaults.integer(forKey: key)
    }
}
