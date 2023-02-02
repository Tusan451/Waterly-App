//
//  AppSettingsInteractorOutputProtocol.swift
//  Waterly App
//
//  Created by Olegio on 01.02.2023.
//

import Foundation

protocol AppSettingsInteractorOutputProtocol: AnyObject {
    func receiveMainTitle(_ title: String)
    func receiveNotificationsMenuItem(_ item: MenuItem)
    func receiveLightThemeMenuItem(_ item: MenuItem)
    func receiveDarkThemeMenuItem(_ item: MenuItem)
    func receiveSystemThemeMenuItem(_ item: MenuItem)
    func receiveUpdatedMenuItemsStatus(lightThemeIsOn: Bool,
                                       darkThemeIsOn: Bool,
                                       systemThemeIsOn: Bool)
    func receiveCurrentAppTheme(_ theme: Int)
    func receiveNotificationsStatus(_ isOn: Bool)
}
