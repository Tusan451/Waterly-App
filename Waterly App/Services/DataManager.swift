//
//  DataManager.swift
//  Waterly App
//
//  Created by Olegio on 01.02.2023.
//

import Foundation

enum AppTheme: Int {
    case system = 0
    case light = 1
    case dark = 2
}

private let notificationsKey = "NotificationsStatus"
private let lightThemeKey = "LightThemeStatus"
private let darkThemeKey = "DarkThemeStatus"
private let systemThemeKey = "SystemThemeStatus"
private let themeKey = "theme"

class DataManager {
    
    static let shared = DataManager()
    
    private let userDefaults = UserDefaults.standard
        
    // MARK: - Save to UserDefaults
    
    func setNotificationsStatus(_ status: Bool) {
        userDefaults.set(status, forKey: notificationsKey)
    }
    
    func setLightThemeStatus(_ status: Bool) {
        userDefaults.set(status, forKey: lightThemeKey)
    }
    
    func setDarkThemeStatus(_ status: Bool) {
        userDefaults.set(status, forKey: darkThemeKey)
    }
    
    func setSystemThemeStatus(_ status: Bool) {
        userDefaults.set(status, forKey: systemThemeKey)
    }
    
    func setCurrentAppTheme(_ theme: AppTheme) {
        userDefaults.set(theme.rawValue, forKey: themeKey)
    }
    
    // MARK: - Get from UserDefaults
    
    func getNotificationsStatus() -> Bool? {
        return userDefaults.object(forKey: notificationsKey) == nil ?
        nil : userDefaults.bool(forKey: notificationsKey)
    }
    
    func getLightThemeStatus() -> Bool? {
        return userDefaults.object(forKey: lightThemeKey) == nil ?
        nil : userDefaults.bool(forKey: lightThemeKey)
    }
    
    func getDarkThemeStatus() -> Bool? {
        return userDefaults.object(forKey: darkThemeKey) == nil ?
        nil : userDefaults.bool(forKey: darkThemeKey)
    }
    
    func getSystemThemeStatus() -> Bool? {
        return userDefaults.object(forKey: systemThemeKey) == nil ?
        nil : userDefaults.bool(forKey: systemThemeKey)
    }
    
    func getTheme() -> Int? {
        return userDefaults.object(forKey: themeKey) == nil ?
        nil : userDefaults.integer(forKey: themeKey)
    }
}
