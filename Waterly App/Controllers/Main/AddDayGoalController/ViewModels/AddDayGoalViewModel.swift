//
//  AddDayGoalViewModel.swift
//  Waterly App
//
//  Created by Olegio on 19.01.2023.
//

import Foundation

enum AlertType {
    case littleValue
    case biggerValue
    case notShow
}

enum SaveButtonState {
    case turnOff
    case turnOn
}

protocol AddDayGoalViewModelProtocol: AnyObject {
    var dailyGoal: Int { get }
    var title: String { get }
    var textFieldPlaceholder: String { get }
    var dismissButtonTitle: String { get }
    var saveButtonTitle: String { get }
    var saveButtonState: SaveButtonState { get }
    var saveButtonChange: ((SaveButtonState) -> (Void))? { get set }
    var alertLitleValueTitle: String { get }
    var alertBigValueTitle: String { get }
    var alertMessage: String { get }
    var alertOkActionTitle: String { get }
    var minimumWaterValue: Int { get }
    var maximumWaterValue: Int { get }
    var alert: AlertType { get }
    var viewDidChange: ((AddDayGoalViewModelProtocol) -> (Void))? { get set }
    func saveButtonPressed(_ value: Int)
    func setSaveButtonStateFor(_ value: String)
}

class AddDayGoalViewModel: AddDayGoalViewModelProtocol {
    
    var dailyGoal: Int = dayGoal {
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
    
    var saveButtonState: SaveButtonState = .turnOn {
        didSet {
            saveButtonChange?(self.saveButtonState)
        }
    }
    
    var saveButtonChange: ((SaveButtonState) -> (Void))?
    
    var alertLitleValueTitle: String {
        Resources.Strings.Alert.AddDayGoalController.littleValueHeader
    }
    
    var alertBigValueTitle: String {
        Resources.Strings.Alert.AddDayGoalController.bigValueHeader
    }
    
    var alertMessage: String {
        Resources.Strings.Alert.AddDayGoalController.valueText
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
    
    var alert: AlertType = .notShow {
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
            dayGoal = value
        }
    }
    
    func setSaveButtonStateFor(_ value: String) {
        saveButtonState = value.isEmpty ? .turnOff : .turnOn
    }
}
