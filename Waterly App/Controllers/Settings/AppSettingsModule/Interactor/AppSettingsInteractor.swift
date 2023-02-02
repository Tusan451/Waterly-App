//
//  AppSettingsInteractor.swift
//  Waterly App
//
//  Created by Olegio on 01.02.2023.
//

import Foundation

class AppSettingsInteractor: AppSettingsInteractorInputProtocol {
    
    unowned let presenter: AppSettingsInteractorOutputProtocol
    
    var notificationsIsOn: Bool {
        get {
            if let value = DataManager.shared.getNotificationsStatus() {
                return value
            } else { return true }
        } set {
            DataManager.shared.setNotificationsStatus(newValue)
        }
    }
    
    var lightThemeIsOn: Bool {
        get {
            if let value = DataManager.shared.getLightThemeStatus() {
                return value
            } else { return false }
        } set {
            DataManager.shared.setLightThemeStatus(newValue)
        }
    }
    
    var darkThemeIsOn: Bool {
        get {
            if let value = DataManager.shared.getDarkThemeStatus() {
                return value
            } else { return false }
        } set {
            DataManager.shared.setDarkThemeStatus(newValue)
        }
    }
    
    var systemThemeIsOn: Bool {
        get {
            if let value = DataManager.shared.getSystemThemeStatus() {
                return value
            } else {
                DataManager.shared.setCurrentAppTheme(.system)
                return true
            }
        } set {
            DataManager.shared.setSystemThemeStatus(newValue)
        }
    }
    
    required init(_ presenter: AppSettingsInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func provideMainTitle() {
        let title = Resources.Strings.SettingsModule.mainControllerAppSettingsTitle
        presenter.receiveMainTitle(title)
    }
    
    func provideNotificationsMenuItem() {
        let item = MenuItem(
            mainTitle: Resources.Strings.SettingsModule.AppSettingsModule.notificationsMainTitle,
            secondaryTitle: Resources.Strings.SettingsModule.AppSettingsModule.notificationsSecondaryTitle,
            isOn: notificationsIsOn
        )
        presenter.receiveNotificationsMenuItem(item)
    }
    
    func provideLightThemeMenuItem() {
        let item = MenuItem(
            mainTitle: Resources.Strings.SettingsModule.AppSettingsModule.lightThemeMainTitle,
            secondaryTitle: nil,
            isOn: lightThemeIsOn
        )
        presenter.receiveLightThemeMenuItem(item)
    }
    
    func provideDarkThemeMenuItem() {
        let item = MenuItem(
            mainTitle: Resources.Strings.SettingsModule.AppSettingsModule.darkThemeMainTitle,
            secondaryTitle: nil,
            isOn: darkThemeIsOn
        )
        presenter.receiveDarkThemeMenuItem(item)
    }
    
    func provideSystemThemeMenuItem() {
        let item = MenuItem(
            mainTitle: Resources.Strings.SettingsModule.AppSettingsModule.systemThemeMainTitle,
            secondaryTitle: nil,
            isOn: systemThemeIsOn
        )
        presenter.receiveSystemThemeMenuItem(item)
    }
    
    func provideCurrentAppTheme() {
        if let theme = DataManager.shared.getTheme() {
            presenter.receiveCurrentAppTheme(theme)
        }
    }
    
    func toggleLightThemeStatus() {
        
        if !lightThemeIsOn {
            lightThemeIsOn.toggle()
            darkThemeIsOn = false
            systemThemeIsOn = false
            DataManager.shared.setCurrentAppTheme(.light)
        } else {
            lightThemeIsOn = true
            darkThemeIsOn = false
            systemThemeIsOn = false
        }
        
        presenter.receiveUpdatedMenuItemsStatus(
            lightThemeIsOn: lightThemeIsOn,
            darkThemeIsOn: darkThemeIsOn,
            systemThemeIsOn: systemThemeIsOn
        )
        
        if let theme = DataManager.shared.getTheme() {
            presenter.receiveCurrentAppTheme(theme)
        }
    }
    
    func toggleDarkThemeStatus() {
        
        if !darkThemeIsOn {
            darkThemeIsOn.toggle()
            lightThemeIsOn = false
            systemThemeIsOn = false
            DataManager.shared.setCurrentAppTheme(.dark)
        } else {
            darkThemeIsOn = true
            lightThemeIsOn = false
            systemThemeIsOn = false
        }
        
        presenter.receiveUpdatedMenuItemsStatus(
            lightThemeIsOn: lightThemeIsOn,
            darkThemeIsOn: darkThemeIsOn,
            systemThemeIsOn: systemThemeIsOn
        )
        
        if let theme = DataManager.shared.getTheme() {
            presenter.receiveCurrentAppTheme(theme)
        }
    }
    
    func toggleSystemThemeStatus() {
        
        if !systemThemeIsOn {
            systemThemeIsOn.toggle()
            lightThemeIsOn = false
            darkThemeIsOn = false
            DataManager.shared.setCurrentAppTheme(.system)
        } else {
            systemThemeIsOn = true
            lightThemeIsOn = false
            darkThemeIsOn = false
        }
        
        presenter.receiveUpdatedMenuItemsStatus(
            lightThemeIsOn: lightThemeIsOn,
            darkThemeIsOn: darkThemeIsOn,
            systemThemeIsOn: systemThemeIsOn
        )
        
        if let theme = DataManager.shared.getTheme() {
            presenter.receiveCurrentAppTheme(theme)
        }
    }
    
    func toggleNotificationsStatus() {
        notificationsIsOn.toggle()
        presenter.receiveNotificationsStatus(notificationsIsOn)
    }
}
