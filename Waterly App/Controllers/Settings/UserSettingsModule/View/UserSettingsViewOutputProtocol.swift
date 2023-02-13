//
//  UserSettingsViewOutputProtocol.swift
//  Waterly App
//
//  Created by Olegio on 07.02.2023.
//

import Foundation

protocol UserSettingsViewOutputProtocol {
    init(_ view: UserSettingsViewInputProtocol)
    func provideDefaultLabelsSettings()
    func sliderValueDidChanged(to value: Float)
    func provideSaveButtonStateWith(nameValue: String,
                                    ageValue: String,
                                    heightValue: String,
                                    weightValue: String)
    func maleRButtonDidPressed()
    func femaleRButtonDidPressed()
    func saveButtonDidPressed(name: String,
                              male: RadioButtonState,
                              female: RadioButtonState,
                              age: String,
                              height: String,
                              weight: String,
                              activity: Float)
}
