//
//  SettingsViewInputProtocol.swift
//  Waterly App
//
//  Created by Olegio on 30.01.2023.
//

import Foundation

protocol SettingsViewInputProtocol: AnyObject {
    func setUserName(_ userName: String)
    func setUserInfo(_ userInfo: String)
    func setUserSettingsMenuItem(title: String, imageName: String)
    func setAppSettingsMenuItem(title: String, imageName: String)
    func setNavigationBarTitle(navBarTitle: String)
    func setTabBarTitle(title: String)
    func performUserSettingsMenuItemAction(with message: String)
    func performAppSettingsMenuItemAction(with message: String)
}
