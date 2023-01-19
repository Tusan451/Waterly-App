//
//  DailyGoalTextFieldViewModel.swift
//  Waterly App
//
//  Created by Olegio on 18.01.2023.
//

import Foundation

protocol DailyGoalTextFieldViewModelProtocol {
    var title: String { get }
    var text: String? { get }
    var placeholder: String? { get }
    init(text: String?, placeholder: String?)
    func getCurrentText(_ text: String?) -> String
}

class DailyGoalTextFieldViewModel: DailyGoalTextFieldViewModelProtocol {
    
    var title: String {
        Resources.Strings.MainController.AddDayGoalController.currentGoal
    }
    
    var text: String?
                
    var placeholder: String?
        
    required init(text: String?, placeholder: String?) {
        self.text = text
        self.placeholder = placeholder
    }
    
    func getCurrentText(_ text: String?) -> String {
        guard let text = text else { return "" }
        return text
    }
}
