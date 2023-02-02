//
//  AppSettingsViewInputProtocol.swift
//  Waterly App
//
//  Created by Olegio on 01.02.2023.
//

import Foundation

protocol AppSettingsViewInputProtocol: AnyObject {
    func setMainTitle(_ title: String)
    func setNotificationsMenuItem(_ item: MenuItem)
    func setLightThemeMenuItem(_ item: MenuItem)
    func setDarkThemeMenuItem(_ item: MenuItem)
    func setSystemThemeMenuItem(_ item: MenuItem)
    func setUpdatedSwitchesValues(lightThemeIsOn: Bool,
                                  darkThemeIsOn: Bool,
                                  systemThemeIsOn: Bool
    )
    func setCurrentAppTheme(_ theme: Int)
    func setNotificationsSwitchValue(_ isOn: Bool)
}
