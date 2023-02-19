//
//  RecomendDailyWaterViewModel.swift
//  Waterly App
//
//  Created by Olegio on 18.01.2023.
//

import Foundation

protocol RecomendDailyWaterViewModelProtocol: AnyObject {
    var text: String { get }
    var value: String { get }
}

class RecomendDailyWaterViewModel: RecomendDailyWaterViewModelProtocol {
    var text: String {
        Resources.Strings.MainController.AddDayGoalController.reccomendGoalText
    }
    
    var value: String {
        getWaterRate()
    }
    
    private func getWaterRate() -> String {
        var waterRateReturn = 0
        
        UserDataManager.shared.getUserData { result in
            switch result {
            case .success(let data):
                if let waterRate = UserDataManager.shared.getWaterRate(for: "\(data.id)") {
                    waterRateReturn = waterRate
                } else {
                    waterRateReturn = 0
                }
            case .failure(let error):
                waterRateReturn = 0
                print("ERROR: \(error)")
            }
        }
        return "\(waterRateReturn)"
    }
}
