//
//  AppSettingsPresenter.swift
//  Waterly App
//
//  Created by Olegio on 01.02.2023.
//

import Foundation

struct MenuItem {
    let mainTitle: String
    let secondaryTitle: String?
    let isOn: Bool
}

class AppSettingsPresenter: AppSettingsViewOutputProtocol {

    unowned let view: AppSettingsViewInputProtocol
    
    var interactor: AppSettingsInteractorInputProtocol!
    
    required init(_ view: AppSettingsViewInputProtocol) {
        self.view = view
    }
    
    func provideMainTitle() {
        interactor.provideMainTitle()
    }
    
    func provideNotificationsMenuItem() {
        interactor.provideNotificationsMenuItem()
    }
    
    func provideLightThemeMenuItem() {
        interactor.provideLightThemeMenuItem()
    }
    
    func provideDarkThemeMenuItem() {
        interactor.provideDarkThemeMenuItem()
    }
    
    func provideSystemThemeMenuItem() {
        interactor.provideSystemThemeMenuItem()
    }
    
    func provideCurrentAppTheme() {
        interactor.provideCurrentAppTheme()
    }
    
    func lightMenuItemSwitchToggle() {
        interactor.toggleLightThemeStatus()
    }
    
    func darkMenuItemSwitchToggle() {
        interactor.toggleDarkThemeStatus()
    }
    
    func systemMenuItemSwitchToggle() {
        interactor.toggleSystemThemeStatus()
    }
    
    func notificationsMenuItemSwitchToggle() {
        interactor.toggleNotificationsStatus()
    }
}

// MARK: - AppSettingsInteractorOutputProtocol

extension AppSettingsPresenter: AppSettingsInteractorOutputProtocol {
    
    func receiveMainTitle(_ title: String) {
        view.setMainTitle(title)
    }
    
    func receiveNotificationsMenuItem(_ item: MenuItem) {
        view.setNotificationsMenuItem(item)
    }
    
    func receiveLightThemeMenuItem(_ item: MenuItem) {
        view.setLightThemeMenuItem(item)
    }
    
    func receiveDarkThemeMenuItem(_ item: MenuItem) {
        view.setDarkThemeMenuItem(item)
    }
    
    func receiveSystemThemeMenuItem(_ item: MenuItem) {
        view.setSystemThemeMenuItem(item)
    }
    
    func receiveUpdatedMenuItemsStatus(
        lightThemeIsOn: Bool,
        darkThemeIsOn: Bool,
        systemThemeIsOn: Bool
    ) {
        view.setUpdatedSwitchesValues(
            lightThemeIsOn: lightThemeIsOn,
            darkThemeIsOn: darkThemeIsOn,
            systemThemeIsOn: systemThemeIsOn
        )
    }
    
    func receiveCurrentAppTheme(_ theme: Int) {
        view.setCurrentAppTheme(theme)
    }
    
    func receiveNotificationsStatus(_ isOn: Bool) {
        view.setNotificationsSwitchValue(isOn)
    }
}
