//
//  SettingsPresenter.swift
//  Waterly App
//
//  Created by Olegio on 30.01.2023.
//

import Foundation

struct UserData {
    let userName: String
    let userAge: String
    let userWeight: String
    let userHeight: String
}

struct MenuItemData {
    let title: String
    let imageName: String
}

class SettingsPresenter: SettingsViewOutputProtocol {
    
    unowned let view: SettingsViewInputProtocol
    
    var interactor: SettingsInteractorInputProtocol!
    
    var router: SettingsRouterInputProtocol!
    
    required init(view: SettingsViewInputProtocol) {
        self.view = view
    }
    
    func provideUserData() {
        interactor.provideUserData()
    }
    
    func provideUserMenuItemData() {
        interactor.provideUserMenuItemData()
    }
    
    func provideAppMenuItemData() {
        interactor.provideAppMenuItemData()
    }
    
    func provideNavigationBarTitle() {
        interactor.provideNavigationBarTitle()
    }
    
    func provideTabBarTitle() {
        interactor.provideTabBarTitle()
    }
    
    func didTapUserSettingsMenuItem() {
        router.goToUserSettingsModule()
    }
    
    func didTapAppSettingsMenuItem() {
        router.goToAppSettingsModule()
    }
}

// MARK: - SettingsInteractorOutputProtocol

extension SettingsPresenter: SettingsInteractorOutputProtocol {

    func receiveUserData(userData: UserData) {
        
        let userName = userData.userName
        let userAge = userData.userAge
        let userWeight = userData.userWeight
        let userHeight = userData.userHeight
        
        let userInfo = "\(userAge) лет, \(userWeight) кг, \(userHeight) см"
        
        view.setUserName(userName)
        view.setUserInfo(userInfo)
    }
    
    func receiveUserMenuItemData(menuItemData: MenuItemData) {
        let title = menuItemData.title
        let imageName = menuItemData.imageName
        view.setUserSettingsMenuItem(title: title, imageName: imageName)
    }
    
    func receiveAppMenuItemData(menuItemData: MenuItemData) {
        let title = menuItemData.title
        let imageName = menuItemData.imageName
        view.setAppSettingsMenuItem(title: title, imageName: imageName)
    }
    
    func receiveNavigationBarTitle(title: String) {
        view.setNavigationBarTitle(navBarTitle: title)
    }
    
    func receiveTabBarTitle(title: String) {
        view.setTabBarTitle(title: title)
    }
    
    func receiveUserSettingsMenuItemAction(with message: String) {
        view.performUserSettingsMenuItemAction(with: message)
    }
    
    func receiveAppSettingsMenuItemAction(with message: String) {
        view.performAppSettingsMenuItemAction(with: message)
    }
}
