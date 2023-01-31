//
//  SettingsInteractorOutputProtocol.swift
//  Waterly App
//
//  Created by Olegio on 31.01.2023.
//

import Foundation

protocol SettingsInteractorOutputProtocol: AnyObject {
    func receiveUserData(userData: UserData)
    func receiveUserMenuItemData(menuItemData: MenuItemData)
    func receiveAppMenuItemData(menuItemData: MenuItemData)
    func receiveNavigationBarTitle(title: String)
    func receiveTabBarTitle(title: String)
    func receiveUserSettingsMenuItemAction(with message: String)
    func receiveAppSettingsMenuItemAction(with message: String)
}
