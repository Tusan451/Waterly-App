//
//  AppSettingsInteractorInputProtocol.swift
//  Waterly App
//
//  Created by Olegio on 01.02.2023.
//

import Foundation

protocol AppSettingsInteractorInputProtocol {
    var notificationsIsOn: Bool { get set }
    var lightThemeIsOn: Bool { get set }
    var darkThemeIsOn: Bool { get set }
    var systemThemeIsOn: Bool { get set }
    init(_ presenter: AppSettingsInteractorOutputProtocol)
    func provideMainTitle()
    func provideNotificationsMenuItem()
    func provideLightThemeMenuItem()
    func provideDarkThemeMenuItem()
    func provideSystemThemeMenuItem()
    func provideCurrentAppTheme()
    func toggleLightThemeStatus()
    func toggleDarkThemeStatus()
    func toggleSystemThemeStatus()
    func toggleNotificationsStatus()
}
