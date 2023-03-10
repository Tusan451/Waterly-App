//
//  AddDayGoalViewModel.swift
//  Waterly App
//
//  Created by Olegio on 19.01.2023.
//

import Foundation

protocol AddDayGoalViewModelProtocol: AnyObject {
    var dayGoal: Int { get }
    var dailyGoal: Int { get }
    var title: String { get }
    var textFieldPlaceholder: String { get }
    var dismissButtonTitle: String { get }
    var saveButtonTitle: String { get }
    var saveButtonState: Resources.SaveButtonState { get }
    var saveButtonChange: ((Resources.SaveButtonState) -> (Void))? { get set }
    var alertLitleValueTitle: String { get }
    var alertBigValueTitle: String { get }
    var alertMessage: String { get }
    var alertOkActionTitle: String { get }
    var minimumWaterValue: Int { get }
    var maximumWaterValue: Int { get }
    var alert: Resources.AlertType { get }
    var viewDidChange: ((AddDayGoalViewModelProtocol) -> (Void))? { get set }
    func saveButtonPressed(_ value: Int)
    func setSaveButtonStateFor(_ value: String)
}

class AddDayGoalViewModel: AddDayGoalViewModelProtocol {
    
    var dayGoal: Int {
        get {
            if let goal = UserDataManager.shared.getWaterGoal(for: Resources.Keys.waterGoalKey) {
                return goal
            } else {
                return 0
            }
        }
    }
    
    var dailyGoal: Int = 0 {
        didSet {
            viewDidChange?(self)
        }
    }
    
    var title: String {
        Resources.Strings.MainController.AddDayGoalController.dayGoal
    }
    
    var textFieldPlaceholder: String {
        Resources.Strings.MainController.AddDayGoalController.placeholder
    }
    
    var dismissButtonTitle: String {
        Resources.Strings.MainController.AddDayGoalController.dismissButton
    }
    
    var saveButtonTitle: String {
        Resources.Strings.MainController.AddDayGoalController.saveButton
    }
    
    var saveButtonState: Resources.SaveButtonState = .turnOn {
        didSet {
            saveButtonChange?(self.saveButtonState)
        }
    }
    
    var saveButtonChange: ((Resources.SaveButtonState) -> (Void))?
    
    var alertLitleValueTitle: String {
        Resources.Strings.Alert.AddDayGoalController.littleValueHeader
    }
    
    var alertBigValueTitle: String {
        Resources.Strings.Alert.AddDayGoalController.bigValueHeader
    }
    
    var alertMessage: String {
        Resources.Strings.Alert.AddDayGoalController.messageText
    }
    
    var alertOkActionTitle: String {
        Resources.Strings.Alert.AddDayGoalController.okAction
    }
    
    var minimumWaterValue: Int {
        Resources.Values.minimumWaterValue
    }
    
    var maximumWaterValue: Int {
        Resources.Values.maximumWaterValue
    }
    
    var alert: Resources.AlertType = .notShow {
        didSet {
            viewDidChange?(self)
        }
    }
    
    var viewDidChange: ((AddDayGoalViewModelProtocol) -> (Void))?
    
    func saveButtonPressed(_ value: Int) {
        
        if value < minimumWaterValue {
            alert = .littleValue
        } else if value > maximumWaterValue {
            alert = .biggerValue
        } else {
            alert = .notShow
            dailyGoal = value
            UserDataManager.shared.saveWaterGoal(value, for: Resources.Keys.waterGoalKey)
        }
    }
    
    func setSaveButtonStateFor(_ value: String) {
        saveButtonState = value.isEmpty ? .turnOff : .turnOn
    }
}
