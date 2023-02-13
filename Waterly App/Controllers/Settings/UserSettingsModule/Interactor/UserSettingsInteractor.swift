//
//  UserSettingsInteractor.swift
//  Waterly App
//
//  Created by Olegio on 07.02.2023.
//

import Foundation

class UserSettingsInteractor: UserSettingsInteractorInputProtocol {
    unowned let presenter: UserSettingsInteractotOutputProtocol!
    
    required init(_ presenter: UserSettingsInteractotOutputProtocol) {
        self.presenter = presenter
    }
    
    func provideDefaultValues() {
        
        let nameTextFieldTitle =
        Resources.Strings.SettingsModule.UserSettingsModule.nameTextFieldTitle
        
        let ageTextFieldTitle =
        Resources.Strings.SettingsModule.UserSettingsModule.ageTitle
        let ageTextFieldPlaceholder =
        Resources.Strings.SettingsModule.UserSettingsModule.agePlaceholder
        
        let heightTextFieldTitle =
        Resources.Strings.SettingsModule.UserSettingsModule.heightTitle
        let heightTextFieldPlaceholder =
        Resources.Strings.SettingsModule.UserSettingsModule.heightPlaceholder
        
        let weightTextFieldTitle =
        Resources.Strings.SettingsModule.UserSettingsModule.weightTitle
        let weightTextFieldPlaceholder =
        Resources.Strings.SettingsModule.UserSettingsModule.weightPlaceholder
        
        UserDataManager.shared.getUserData { [unowned self] result in
            switch result {
            case .success(let userData):
                var activityLabel = ""
                var activityColor: SliderColor = .yellow
                switch userData.activity {
                case .low:
                    activityLabel =
                    Resources.Strings.SettingsModule.UserSettingsModule.lowPhysicalActivity
                    activityColor = .green
                case .medium:
                    activityLabel =
                    Resources.Strings.SettingsModule.UserSettingsModule.mediumPhysicalActivity
                    activityColor = .yellow
                case .high:
                    activityLabel =
                    Resources.Strings.SettingsModule.UserSettingsModule.highPhysicalActivity
                    activityColor = .red
                }
                
                self.presenter.receiveNameTextFieldValues(
                    nameTextFieldTitle,
                    userData.name
                )
                self.presenter.receiveRButtonsStates(
                    maleRButtonState: userData.gender == .male ? .selected : .normal,
                    femaleRButtonState: userData.gender == .female ? .selected : .normal
                )
                self.presenter.receiveAgeTextFieldValues(
                    ageTextFieldTitle,
                    userData.age,
                    ageTextFieldPlaceholder
                )
                self.presenter.receiveHeightTextFieldValues(
                    heightTextFieldTitle,
                    userData.height,
                    heightTextFieldPlaceholder
                )
                self.presenter.receiveWeightTextFieldValues(
                    weightTextFieldTitle,
                    userData.weight,
                    weightTextFieldPlaceholder
                )
                self.presenter.receiveUpdatedActivityLabel(
                    activityLabel,
                    activityColor
                )
            case .failure(let error):
                print(error)
                self.presenter.receiveNameTextFieldValues(
                    nameTextFieldTitle,
                    nil
                )
                self.presenter.receiveRButtonsStates(
                    maleRButtonState: .selected,
                    femaleRButtonState: .normal
                )
                self.presenter.receiveAgeTextFieldValues(
                    ageTextFieldTitle,
                    nil,
                    ageTextFieldPlaceholder
                )
                self.presenter.receiveHeightTextFieldValues(
                    heightTextFieldTitle,
                    nil,
                    heightTextFieldPlaceholder
                )
                self.presenter.receiveWeightTextFieldValues(
                    weightTextFieldTitle,
                    nil,
                    weightTextFieldPlaceholder
                )
                self.presenter.receiveUpdatedActivityLabel(
                    Resources.Strings.SettingsModule.UserSettingsModule.mediumPhysicalActivity,
                    .yellow
                )
            }
        }
        
        let defaultValues = DefaultValues(
            screenTitle: Resources.Strings.SettingsModule.mainControllerUserSettingsTitle,
            genderTitle: Resources.Strings.SettingsModule.UserSettingsModule.genderTitle,
            maleTitle: Resources.Strings.SettingsModule.UserSettingsModule.male,
            femaleTitle: Resources.Strings.SettingsModule.UserSettingsModule.female,
            activityTitle: Resources.Strings.SettingsModule.UserSettingsModule.physicalActivityTitle,
            buttonTitle: Resources.Strings.SettingsModule.UserSettingsModule.saveButtonTitle,
            disclaimer: Resources.Strings.SettingsModule.UserSettingsModule.disclaimer
        )
        
        presenter.receiveDefaultValues(defaultValues)
    }
    
    func provideActivityLabel(for sliderValue: Float) {
        switch sliderValue {
        case _ where sliderValue < 2:
            presenter.receiveUpdatedActivityLabel(
                Resources.Strings.SettingsModule.UserSettingsModule.lowPhysicalActivity,
                .green
            )
        case _ where sliderValue > 2 && sliderValue < 3:
            presenter.receiveUpdatedActivityLabel(
                Resources.Strings.SettingsModule.UserSettingsModule.mediumPhysicalActivity,
                .yellow
            )
        default:
            presenter.receiveUpdatedActivityLabel(
                Resources.Strings.SettingsModule.UserSettingsModule.highPhysicalActivity,
                .red
            )
        }
    }
    
    func provideSaveButtonStateWith(_ currentInputValues: CurrentInputValues) {
        if currentInputValues.name.isEmpty ||
            currentInputValues.age.isEmpty ||
            currentInputValues.height.isEmpty ||
            currentInputValues.weight.isEmpty {
            
            presenter.receiveSaveButtonState(with: .off)
            
        } else {
            presenter.receiveSaveButtonState(with: .on)
        }
    }
    
    func maleRButtonDidPressed() {
        presenter.receiveRButtonsStates(maleRButtonState: .selected,
                                        femaleRButtonState: .normal)
    }
    
    func femaleRButtonDidPressed() {
        presenter.receiveRButtonsStates(maleRButtonState: .normal,
                                        femaleRButtonState: .selected)
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
        let gender: UserGender = male == .selected ? .male : .female
        var userActivity: UserActivity = .medium
        
        switch activity {
        case _ where activity < 2:
            userActivity = .low
        case _ where activity > 2 && activity < 3:
            userActivity = .medium
        default:
            userActivity = .high
        }
        
        let user = UserDataModel(
            id: UUID(),
            name: name,
            gender: gender,
            age: age,
            height: height,
            weight: weight,
            activity: userActivity
        )
        
        UserDataManager.shared.saveUserData(user)
        presenter.userDataDidSaved()
    }
}
