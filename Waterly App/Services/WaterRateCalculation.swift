//
//  WaterRateCalculation.swift
//  Waterly App
//
//  Created by Olegio on 06.02.2023.
//

import Foundation

protocol WaterRateCalculationProtocol {
    func calculateWaterRate(for user: UserDataModel) -> Int?
}

enum WeightNorm {
    case low
    case normal
    case high
}

class WaterRateCalculation: WaterRateCalculationProtocol {
    static let shared = WaterRateCalculation()
    private let heightStatic = 100
    private var weightNorm: WeightNorm = .normal
    private var waterRate = 0
    
    func calculateWaterRate(for user: UserDataModel) -> Int? {
        guard let height = Int(user.height) else { return nil }
        guard let weight = Int(user.weight) else { return nil }
        
        let reccomendWeight = height - heightStatic
        let weightDifference = reccomendWeight - weight
        
        switch weightDifference {
        case _ where weightDifference < 15 || weightDifference > -15:
            weightNorm = .normal
        case _ where weightDifference > 15:
            weightNorm = .low
        case _ where weightDifference < -15:
            weightNorm = .high
        default:
            break
        }
        
        let userActivity = user.activity
        
        switch weightNorm {
        case .low:
            if userActivity != .high {
                waterRate = weight * 20
            } else {
                waterRate = weight * 25
            }
        case .normal:
            if userActivity == .low {
                waterRate = weight * 25
            } else if userActivity == .medium {
                waterRate = weight * 30
            } else {
                waterRate = weight * 35
            }
        case .high:
            if userActivity == .low {
                waterRate = weight * 30
            } else if userActivity == .medium {
                waterRate = weight * 35
            } else {
                waterRate = weight * 40
            }
        }
        
        return waterRate
    }
}
