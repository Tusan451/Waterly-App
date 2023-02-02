//
//  AppSettingsViewOutputProtocol.swift
//  Waterly App
//
//  Created by Olegio on 01.02.2023.
//

import Foundation

protocol AppSettingsViewOutputProtocol {
    init(_ view: AppSettingsViewInputProtocol)
    func provideMainTitle()
    func provideNotificationsMenuItem()
    func provideLightThemeMenuItem()
    func provideDarkThemeMenuItem()
    func provideSystemThemeMenuItem()
    func provideCurrentAppTheme()
    func lightMenuItemSwitchToggle()
    func darkMenuItemSwitchToggle()
    func systemMenuItemSwitchToggle()
    func notificationsMenuItemSwitchToggle()
}
