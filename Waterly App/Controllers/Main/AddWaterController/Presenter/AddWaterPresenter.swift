//
//  AddWaterPresenter.swift
//  Waterly App
//
//  Created by Olegio on 23.01.2023.
//

import Foundation

enum DailyPercentValueState {
    case notFocus
    case focus
}

enum ArrowState {
    case isHidden
    case show
}

protocol AddWaterViewProtocol: AnyObject {
    func setMainTitle(title: String)
    func setTextFieldTextValues(title: String, placeholder: String, valuePlaceholder: String)
    func setDismissButtonTitle(title: String)
    func setActionButtonTitle(title: String)
    func setDailyPercentViewTitle(title: String)
    func setDailyPercentViewValue(value: String, state: DailyPercentValueState)
    func setCurrentProgressViewTitle(title: String)
    func setCurrentProgressViewValue(value: String)
    func setCurrentProgressViewValueFor(newValue: String?, arrowState: ArrowState)
    func setSaveButtonState(state: Resources.SaveButtonState)
    func showAlert(title: String, message: String, okButtonTitle: String)
    func dismiss() -> Void
    func clearTextFieldText(placeholder: String?)
}

protocol AddWaterPresenterProtocol: AnyObject {
    var mainTitle: String { get }
    var dismissButtonTitle: String { get }
    var saveButtonTitle: String { get }
    var textFieldTitle: String { get }
    var textFieldPlaceholder: String { get }
    var textFieldValuePlaceholder: String { get }
    var dailyPercentViewTitle: String { get }
    var currentProgressTitle: String { get }
    var saveButtonState: Resources.SaveButtonState { get }
    var minimumAddWaterValue: Int { get }
    var maximumAddWaterValue: Int { get }
    var alertLitleValueTitle: String { get }
    var alertBigValueTitle: String { get }
    var alertMessage: String { get }
    var alertOkButtonTitle: String { get }
    init(view: AddWaterViewProtocol)
    func setViewTitle()
    func setTextFieldTextValues()
    func setDailyPercentViewTitle()
    func setDismissButtonTitle()
    func setSaveButtonTitle()
    func saveButtonPressed(_ value: String?)
    func configureDailyPercentViewValue(_ value: String?)
    func configureCurrentProgressViewTitle()
    func setCurrentProgressViewValue()
    func configureCurrentProgressViewFor(value: String?)
    func setSaveButtonStateFor(_ value: String)
}

class AddWaterPresenter: AddWaterPresenterProtocol {

    // MARK: - Variables
    
    weak var view: AddWaterViewProtocol?
    
    var mainTitle: String {
        Resources.Strings.MainController.AddWaterController.header
    }
    
    var dismissButtonTitle: String {
        Resources.Strings.MainController.AddWaterController.dismissButton
    }
    
    var saveButtonTitle: String {
        Resources.Strings.MainController.AddWaterController.saveButton
    }
    
    var textFieldTitle: String {
        Resources.Strings.MainController.AddWaterController.textFieldHeader
    }
    
    var textFieldText: String?
    
    var textFieldPlaceholder: String {
        Resources.Strings.MainController.AddWaterController.placeholder
    }
    
    var textFieldValuePlaceholder: String {
        Resources.Strings.MainController.AddWaterController.mililiters
    }
    
    var dailyPercentViewTitle: String {
        Resources.Strings.MainController.AddWaterController.dailyPercent
    }
    
    var currentProgressTitle: String {
        Resources.Strings.MainController.AddWaterController.currentProgress
    }
    
    var saveButtonState: Resources.SaveButtonState = .turnOn
    
    var minimumAddWaterValue: Int {
        Resources.Values.minimumAddWaterValue
    }
    
    var maximumAddWaterValue: Int {
        Resources.Values.maximumAddWaterValue
    }
        
    var alertLitleValueTitle: String {
        Resources.Strings.Alert.AddWaterController.littleValueHeader
    }
    
    var alertBigValueTitle: String {
        Resources.Strings.Alert.AddWaterController.bigValueHeader
    }
    
    var alertMessage: String {
        Resources.Strings.Alert.AddWaterController.messageText
    }
    
    var alertOkButtonTitle: String {
        Resources.Strings.Alert.AddWaterController.okAction
    }
    
    // MARK: - Initializers
    
    required init(view: AddWaterViewProtocol) {
        self.view = view
    }
    
    // MARK: - Methods
    
    func setViewTitle() {
        self.view?.setMainTitle(title: self.mainTitle)
    }
    
    func setTextFieldTextValues() {
        self.view?.setTextFieldTextValues(title: self.textFieldTitle,
                                         placeholder: self.textFieldPlaceholder,
                                         valuePlaceholder: self.textFieldValuePlaceholder)
    }
    
    func setDailyPercentViewTitle() {
        self.view?.setDailyPercentViewTitle(title: self.dailyPercentViewTitle)
    }
    
    func setDismissButtonTitle() {
        self.view?.setDismissButtonTitle(title: self.dismissButtonTitle)
    }
    
    func setSaveButtonTitle() {
        self.view?.setActionButtonTitle(title: self.saveButtonTitle)
    }
    
    func saveButtonPressed(_ value: String?) {
        
        
        
        guard let value = value else { return }
        guard let intValue = Int(value) else { return }
        
        if intValue < self.minimumAddWaterValue {
            
            self.view?.showAlert(title: self.alertLitleValueTitle,
                                 message: self.alertMessage,
                                 okButtonTitle: self.alertOkButtonTitle)
            
            self.view?.clearTextFieldText(placeholder: self.textFieldPlaceholder)
            
        } else if intValue > self.maximumAddWaterValue {
            
            self.view?.showAlert(title: self.alertBigValueTitle,
                                 message: self.alertMessage,
                                 okButtonTitle: self.alertOkButtonTitle)
            
            self.view?.clearTextFieldText(placeholder: self.textFieldPlaceholder)
            
        } else {
            
            if var currentProgress = UserDataManager.shared.getWaterProgress(
                for: Resources.Keys.waterProgressKey
            ) {
                currentProgress += intValue
                UserDataManager.shared.saveWaterProgress(
                    currentProgress,
                    for: Resources.Keys.waterProgressKey
                )
            } else {
                UserDataManager.shared.saveWaterProgress(
                    intValue,
                    for: Resources.Keys.waterProgressKey
                )
            }
            
            let waterCapacity = WaterCapacity(capacity: intValue, date: nil)
            WaterDataManager.shared.saveWaterCapacity(waterCapacity, for: Resources.Keys.dayProgressKey)
            
            self.view?.dismiss()
        }
    }
    
    func configureDailyPercentViewValue(_ value: String?) {
        
        guard let value = value else { return }
        var waterRateValue = 0
        
        UserDataManager.shared.getUserData { result in
            switch result {
            case .success(let data):
                if let waterRate = UserDataManager.shared.getWaterRate(for: "\(data.id)") {
                    waterRateValue = waterRate
                } else {
                    waterRateValue = 0
                }
            case .failure(let error):
                waterRateValue = 0
                print(error)
            }
        }
        
        if value.isEmpty {
            self.view?.setDailyPercentViewValue(value: "0%", state: .notFocus)
        } else {
            guard let doubleValue = Double(value) else { return }
            let percentFromDaily = lround(doubleValue / Double(waterRateValue / 100))
            self.view?.setDailyPercentViewValue(value: "\(percentFromDaily)%", state: .focus)
        }
    }
    
    func configureCurrentProgressViewTitle() {
        self.view?.setCurrentProgressViewTitle(title: self.currentProgressTitle)
    }
    
    func setCurrentProgressViewValue() {
        let dayGoal = UserDataManager.shared.getWaterGoal(for: Resources.Keys.waterGoalKey)
        let waterProgress = UserDataManager.shared.getWaterProgress(for: Resources.Keys.waterProgressKey)
        
        let value = dayGoal == nil ? 0 : lround(Double(waterProgress ?? 0) / Double((dayGoal ?? 0) / 100))
        print("Value: \(value)")
        self.view?.setCurrentProgressViewValue(value: "\(value)%")
    }
    
    func configureCurrentProgressViewFor(value: String?) {
        
        guard let value = value else { return }
        let dayGoal = UserDataManager.shared.getWaterGoal(for: Resources.Keys.waterGoalKey)
        let waterProgress = UserDataManager.shared.getWaterProgress(for: Resources.Keys.waterProgressKey)
        
        if value.isEmpty {
            self.view?.setCurrentProgressViewValueFor(newValue: value, arrowState: .isHidden)
        } else {
            guard let doubleValue = Double(value) else { return }
            let newDailyValue = Double(waterProgress ?? 0) + doubleValue
            let newDailyPercentProgress = lround(newDailyValue / Double((dayGoal ?? 0) / 100))
            self.view?.setCurrentProgressViewValueFor(newValue: "\(newDailyPercentProgress)%", arrowState: .show)
        }
    }
    
    func setSaveButtonStateFor(_ value: String) {
        self.saveButtonState = value.isEmpty ? .turnOff : .turnOn
        self.view?.setSaveButtonState(state: self.saveButtonState)
    }
}
