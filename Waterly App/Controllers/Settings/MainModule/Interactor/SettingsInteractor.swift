//
//  SettingsInteractor.swift
//  Waterly App
//
//  Created by Olegio on 31.01.2023.
//

import Foundation

class SettingsInteractor: SettingsInteractorInputProtocol {
    
    unowned let presenter: SettingsInteractorOutputProtocol
    
    required init(presenter: SettingsInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func provideUserData() {
        let userData = UserData(userName: "Олег Федотов",
                                userAge: "31",
                                userWeight: "76",
                                userHeight: "178")
        
        presenter.receiveUserData(userData: userData)
    }
    
    func provideUserMenuItemData() {
        let userMenuItemData = MenuItemData(
            title: Resources.Strings.SettingsModule.mainControllerUserSettingsTitle,
            imageName: Resources.Images.SettingsModule.user
        )
        presenter.receiveUserMenuItemData(menuItemData: userMenuItemData)
    }
    
    func provideAppMenuItemData() {
        let appMenuItemData = MenuItemData(
            title: Resources.Strings.SettingsModule.mainControllerAppSettingsTitle,
            imageName: Resources.Images.SettingsModule.settings
        )
        presenter.receiveAppMenuItemData(menuItemData: appMenuItemData)
    }
    
    func provideNavigationBarTitle() {
        let title = Resources.Strings.SettingsModule.mainControllerTitle
        presenter.receiveNavigationBarTitle(title: title)
    }
    
    func provideTabBarTitle() {
        let title = Resources.Strings.SettingsModule.mainControllerTitle
        presenter.receiveTabBarTitle(title: title)
    }
    
    func performUserSettingsMenuItemAction() {
        let message = "userSettingsMenuItemTapped"
        presenter.receiveUserSettingsMenuItemAction(with: message)
    }
}
