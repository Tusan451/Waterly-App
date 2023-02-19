//
//  WaterDataManager.swift
//  Waterly App
//
//  Created by Olegio on 16.02.2023.
//

import Foundation

protocol WaterDataManagerProtocol {
    init(userDefaults: UserDefaults, encoder: JSONEncoder, decoder: JSONDecoder)
    func saveWaterCapacity(_ capacity: WaterCapacity, for key: String)
    func getWaterProgress(for key: String, completion: @escaping (Result<WaterProgress, Error>) -> Void)
}

class WaterDataManager: WaterDataManagerProtocol {
    static let shared = WaterDataManager()
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
    
    func saveWaterCapacity(_ capacity: WaterCapacity, for key: String) {
        var waterProgress = WaterProgress(progressArray: [WaterCapacity]())
        
        getWaterProgress(for: key) { result in
            switch result {
            case .success(let data):
                waterProgress = data
            case .failure(let error):
                print(error)
            }
        }
        
        if waterProgress.progressArray.count == 6 {
            waterProgress.progressArray.removeFirst()
        }
        
        waterProgress.progressArray.append(capacity)
        saveWaterProgress(waterProgress, for: key)
    }
    
    func getWaterProgress(for key: String, completion: @escaping (Result<WaterProgress, Error>) -> Void) {
        guard let data = userDefaults.data(forKey: key) else {
            completion(.failure(DataManagerError.invalidKey))
            return
        }
        do {
            let waterProgress = try self.decoder.decode(WaterProgress.self, from: data)
            completion(.success(waterProgress))
        } catch {
            completion(.failure(error))
            print(error)
        }
    }
}

extension WaterDataManager {
    private func saveWaterProgress(_ progress: WaterProgress, for key: String) {
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            do {
                let data = try self.encoder.encode(progress)
                self.userDefaults.set(data, forKey: key)
            } catch let error {
                print(error)
            }
        }
    }
}
