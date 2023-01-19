//
//  RecomendDailyWaterViewModel.swift
//  Waterly App
//
//  Created by Olegio on 18.01.2023.
//

import Foundation

protocol RecomendDailyWaterViewModelProtocol {
    var text: String { get }
    var value: String { get }
    func setValue(_ value: Int) -> String
}

class RecomendDailyWaterViewModel: RecomendDailyWaterViewModelProtocol {
    var text: String {
        Resources.Strings.MainController.AddDayGoalController.reccomendGoalText
    }
    
    var value: String = ""
    
    func setValue(_ value: Int) -> String {
        "\(value)"
    }
}
