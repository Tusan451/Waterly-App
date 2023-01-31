//
//  SettingsInteractorInputProtocol.swift
//  Waterly App
//
//  Created by Olegio on 31.01.2023.
//

import Foundation

protocol SettingsInteractorInputProtocol {
    init(presenter: SettingsInteractorOutputProtocol)
    func provideUserData()
    func provideUserMenuItemData()
    func provideAppMenuItemData()
    func provideNavigationBarTitle()
    func provideTabBarTitle()
    func performUserSettingsMenuItemAction()
    func performAppSettingsMenuItemAction()
}
