//
//  UserSettingsInteractotOutputProtocol.swift
//  Waterly App
//
//  Created by Olegio on 07.02.2023.
//

import Foundation

protocol UserSettingsInteractotOutputProtocol: AnyObject {
    func receiveDefaultValues(_ defaultValues: DefaultValues)
    func receiveNameTextFieldValues(_ title: String, _ value: String?)
    func receiveAgeTextFieldValues(_ title: String, _ value: String?, _ placeholder: String)
    func receiveHeightTextFieldValues(_ title: String, _ value: String?, _ placeholder: String)
    func receiveWeightTextFieldValues(_ title: String, _ value: String?, _ placeholder: String)
    func receiveUpdatedActivityLabel(_ title: String, _ color: SliderColor)
    func receiveSaveButtonState(with state: ButtonState)
    func receiveRButtonsStates(maleRButtonState: RadioButtonState,
                               femaleRButtonState: RadioButtonState)
    func userDataDidSaved()
}
