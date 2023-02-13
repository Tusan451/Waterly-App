//
//  UserSettingsPresenter.swift
//  Waterly App
//
//  Created by Olegio on 07.02.2023.
//

import Foundation

enum SliderColor {
    case yellow
    case green
    case red
}

enum ButtonState {
    case on
    case off
}

struct DefaultValues {
    let screenTitle: String
    let genderTitle: String
    let maleTitle: String
    let femaleTitle: String
    let activityTitle: String
    let buttonTitle: String
    let disclaimer: String
}

struct CurrentInputValues {
    let name: String
    let age: String
    let height: String
    let weight: String
}

class UserSettingsPresenter: UserSettingsViewOutputProtocol {
    unowned let view: UserSettingsViewInputProtocol
    var interactor: UserSettingsInteractorInputProtocol!
    var router: UserSettingsRouterInputProtocol!
    
    required init(_ view: UserSettingsViewInputProtocol) {
        self.view = view
    }
    
    func provideDefaultLabelsSettings() {
        interactor.provideDefaultValues()
    }
    
    func sliderValueDidChanged(to value: Float) {
        interactor.provideActivityLabel(for: value)
    }
    
    func provideSaveButtonStateWith(
        nameValue: String,
        ageValue: String,
        heightValue: String,
        weightValue: String
    ) {
        let currentInputValues = CurrentInputValues(
            name: nameValue,
            age: ageValue,
            height: heightValue,
            weight: weightValue
        )
        interactor.provideSaveButtonStateWith(currentInputValues)
    }
    
    func maleRButtonDidPressed() {
        interactor.maleRButtonDidPressed()
    }
    
    func femaleRButtonDidPressed() {
        interactor.femaleRButtonDidPressed()
    }
    
    func saveButtonDidPressed(
        name: String,
        male: RadioButtonState,
        female: RadioButtonState,
        age: String,
        height: String,
        weight: String,
        activity: Float
    ) {
        interactor.saveButtonDidPressed(
            name: name,
            male: male,
            female: female,
            age: age,
            height: height,
            weight: weight,
            activity: activity
        )
    }
}

// MARK: - UserSettingsInteractorInputProtocol

extension UserSettingsPresenter: UserSettingsInteractotOutputProtocol {
    func receiveDefaultValues(_ defaultValues: DefaultValues) {
        view.setScreenTitle(defaultValues.screenTitle)
        view.setGenderTitle(defaultValues.genderTitle)
        view.setMaleTitle(defaultValues.maleTitle)
        view.setFemaleTitle(defaultValues.femaleTitle)
        view.setActivityTitle(defaultValues.activityTitle)
        view.setButtonTitle(defaultValues.buttonTitle)
        view.setDisclaimer(defaultValues.disclaimer)
    }
    
    func receiveNameTextFieldValues(_ title: String, _ value: String?) {
        view.configureNameTextField(title, value)
    }
    
    func receiveAgeTextFieldValues(
        _ title: String,
        _ value: String?,
        _ placeholder: String) {
        
            view.configureAgeTextField(title, value, placeholder)
    }
    
    func receiveHeightTextFieldValues(
        _ title: String,
        _ value: String?,
        _ placeholder: String) {
        
            view.configureHeightTextField(title, value, placeholder)
    }
    
    func receiveWeightTextFieldValues(
        _ title: String,
        _ value: String?,
        _ placeholder: String) {
        
            view.configureWeightTextField(title, value, placeholder)
    }
    
    func receiveUpdatedActivityLabel(_ title: String, _ color: SliderColor) {
        view.setUpdatedActivityLabel(with: title, and: color)
    }
    
    func receiveSaveButtonState(with state: ButtonState) {
        view.setSaveButtonState(with: state)
    }
    
    func receiveRButtonsStates(maleRButtonState: RadioButtonState,
                               femaleRButtonState: RadioButtonState) {
        
        view.setRButtonsStates(male: maleRButtonState,
                               female: femaleRButtonState)
    }
    
    func userDataDidSaved() {
        router.showAlert(
            title: Resources.Strings.SettingsModule.UserSettingsModule.alertTitle,
            message: Resources.Strings.SettingsModule.UserSettingsModule.alertMessage,
            actionTitle: Resources.Strings.SettingsModule.UserSettingsModule.alertActionTitle
        )
    }
}
