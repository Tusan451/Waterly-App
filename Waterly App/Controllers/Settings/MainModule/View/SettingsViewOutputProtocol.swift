//
//  SettingsViewOutputProtocol.swift
//  Waterly App
//
//  Created by Olegio on 30.01.2023.
//

import Foundation

protocol SettingsViewOutputProtocol {
    init(view: SettingsViewInputProtocol)
    func provideUserData()
    func provideUserMenuItemData()
    func provideAppMenuItemData()
    func provideNavigationBarTitle()
    func provideTabBarTitle()
    func didTapUserSettingsMenuItem()
    func didTapAppSettingsMenuItem()
}
