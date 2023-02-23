//
//  DateManager.swift
//  Waterly App
//
//  Created by Olegio on 23.02.2023.
//

import UIKit

extension Date {
    var shortDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM"
        return dateFormatter.string(from: self)
    }
    var fullDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.string(from: self)
    }
}

protocol DateManagerProtocol {
    init(userDefaults: UserDefaults, encoder: JSONEncoder, decoder: JSONDecoder)
    func saveDate(_ date: Date)
    func getSavedDate(completion: @escaping (Result<Date, Error>) -> Void)
}

class DateManager: DateManagerProtocol {
    static let shared = DateManager()
    private let userDefaults: UserDefaults
    private let encoder: JSONEncoder
    private let decoder: JSONDecoder
    
    required init(userDefaults: UserDefaults = .standard,
                  encoder: JSONEncoder = .init(),
                  decoder: JSONDecoder = .init()) {
        
        self.userDefaults = userDefaults
        self.encoder = encoder
        self.decoder = decoder
    }
    
    func saveDate(_ date: Date) {
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            do {
                let data = try self.encoder.encode(date)
                self.userDefaults.set(data, forKey: Resources.Keys.dateKey)
            } catch let error {
                print(error)
            }
        }
    }
    
    func getSavedDate(completion: @escaping (Result<Date, Error>) -> Void) {
        guard let data = userDefaults.data(forKey: Resources.Keys.dateKey) else {
            completion(.failure(DataManagerError.invalidKey))
            return
        }
        do {
            let savedDate = try self.decoder.decode(Date.self, from: data)
            completion(.success(savedDate))
        } catch {
            completion(.failure(error))
            print(error)
        }
    }
}
