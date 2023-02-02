//
//  AppSettingsViewController.swift
//  Waterly App
//
//  Created by Olegio on 31.01.2023.
//

import UIKit

final class AppSettingsViewController: BaseController {
    
    var mainView = AppSettingsMainView()
    
    var presenter: AppSettingsViewOutputProtocol!
}

extension AppSettingsViewController {
    
    override func loadView() {
        view = mainView
    }
    
    override func configureViews() {
        super.configureViews()
        
        navigationItem.largeTitleDisplayMode = .never
        
        presenter.provideMainTitle()
        presenter.provideNotificationsMenuItem()
        presenter.provideLightThemeMenuItem()
        presenter.provideDarkThemeMenuItem()
        presenter.provideSystemThemeMenuItem()
        presenter.provideCurrentAppTheme()
    }
}

// MARK: - AppSettingsMainViewDelegate

extension AppSettingsViewController: AppSettingsMainViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.delegate = self
    }
    
    func notificationsMenuItemSwitch(param: UISwitch) {
        presenter.notificationsMenuItemSwitchToggle()
    }
    
    func lightThemeMenuItemSwitch(param: UISwitch) {
        presenter.lightMenuItemSwitchToggle()
    }
    
    func darkThemeMenuItemSwitch(param: UISwitch) {
        presenter.darkMenuItemSwitchToggle()
    }
    
    func systemThemeMenuItemSwitch(param: UISwitch) {
        presenter.systemMenuItemSwitchToggle()
    }
}

// MARK: - AppSettingsViewInputProtocol

extension AppSettingsViewController: AppSettingsViewInputProtocol {
    
    func setMainTitle(_ title: String) {
        self.title = title
    }
    
    func setNotificationsMenuItem(_ item: MenuItem) {
        mainView.notificationsMenuItemView.setMainTitle(item.mainTitle)
        mainView.notificationsMenuItemView.setSecondaryTitle(item.secondaryTitle)
        mainView.notificationsMenuItemView.menuItemSwitch.setOn(item.isOn, animated: true)
    }
    
    func setLightThemeMenuItem(_ item: MenuItem) {
        mainView.lightThemeMenuItemView.setMainTitle(item.mainTitle)
        mainView.lightThemeMenuItemView.setSecondaryTitle(item.secondaryTitle)
        mainView.lightThemeMenuItemView.menuItemSwitch.setOn(item.isOn, animated: true)
    }
    
    func setDarkThemeMenuItem(_ item: MenuItem) {
        mainView.darkThemeMenuItemView.setMainTitle(item.mainTitle)
        mainView.darkThemeMenuItemView.setSecondaryTitle(item.secondaryTitle)
        mainView.darkThemeMenuItemView.menuItemSwitch.setOn(item.isOn, animated: true)
    }
    
    func setSystemThemeMenuItem(_ item: MenuItem) {
        mainView.systemThemeMenuItemView.setMainTitle(item.mainTitle)
        mainView.systemThemeMenuItemView.setSecondaryTitle(item.secondaryTitle)
        mainView.systemThemeMenuItemView.menuItemSwitch.setOn(item.isOn, animated: true)
    }
    
    func setUpdatedSwitchesValues(
        lightThemeIsOn: Bool,
        darkThemeIsOn: Bool,
        systemThemeIsOn: Bool
    ) {
        mainView.lightThemeMenuItemView.menuItemSwitch.setOn(lightThemeIsOn, animated: true)
        mainView.darkThemeMenuItemView.menuItemSwitch.setOn(darkThemeIsOn, animated: true)
        mainView.systemThemeMenuItemView.menuItemSwitch.setOn(systemThemeIsOn, animated: true)
    }
    
    func setCurrentAppTheme(_ theme: Int) {
        setTheme(theme)
    }
    
    func setNotificationsSwitchValue(_ isOn: Bool) {
        mainView.notificationsMenuItemView.menuItemSwitch.setOn(isOn, animated: true)
    }
}

// MARK: - Private extension

private extension AppSettingsViewController {
    
    func setTheme(_ theme: Int) {
        
        let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .compactMap({$0 as? UIWindowScene})
                .first?.windows
                .filter({$0.isKeyWindow}).first
        
        var appTheme: UIUserInterfaceStyle = .unspecified
        
        switch theme {
        case 0:
            appTheme = .unspecified
        case 1:
            appTheme = .light
        case 2:
            appTheme = .dark
        default:
            break
        }
        
        keyWindow?.overrideUserInterfaceStyle = appTheme
    }
}
