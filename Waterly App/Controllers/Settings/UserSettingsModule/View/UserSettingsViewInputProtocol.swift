//
//  UserSettingsViewInputProtocol.swift
//  Waterly App
//
//  Created by Olegio on 07.02.2023.
//

import Foundation

protocol UserSettingsViewInputProtocol: AnyObject {
    func setScreenTitle(_ title: String)
    func configureNameTextField(_ title: String, _ value: String?)
    func configureAgeTextField(_ title: String, _ value: String?, _ placeholder: String)
    func configureHeightTextField(_ title: String, _ value: String?, _ placeholder: String)
    func configureWeightTextField(_ title: String, _ value: String?, _ placeholder: String)
    func setGenderTitle(_ title: String)
    func setMaleTitle(_ title: String)
    func setFemaleTitle(_ title: String)
    func setActivityTitle(_ title: String)
    func setButtonTitle(_ title: String)
    func setDisclaimer(_ disclaimer: String)
    func setUpdatedActivityLabel(with title: String, and color: SliderColor)
    func setSaveButtonState(with state: ButtonState)
    func setRButtonsStates(male: RadioButtonState, female: RadioButtonState)
}
