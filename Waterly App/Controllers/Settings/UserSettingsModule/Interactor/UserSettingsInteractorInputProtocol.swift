//
//  UserSettingsInteractorInputProtocol.swift
//  Waterly App
//
//  Created by Olegio on 07.02.2023.
//

import Foundation

protocol UserSettingsInteractorInputProtocol {
    init(_ presenter: UserSettingsInteractotOutputProtocol)
    func provideDefaultValues()
    func provideActivityLabel(for sliderValue: Float)
    func provideSaveButtonStateWith(_ currentInputValues: CurrentInputValues)
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
