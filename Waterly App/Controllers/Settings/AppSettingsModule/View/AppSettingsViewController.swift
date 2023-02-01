//
//  AppSettingsViewController.swift
//  Waterly App
//
//  Created by Olegio on 31.01.2023.
//

import UIKit

final class AppSettingsViewController: BaseController {
    
    var mainView = AppSettingsMainView()
}

extension AppSettingsViewController {
    
    override func loadView() {
        view = mainView
    }
    
    override func configureViews() {
        super.configureViews()
        
        navigationItem.largeTitleDisplayMode = .never
        
        title = "Приложение"
    }
}

// MARK: - AppSettingsMainViewDelegate

extension AppSettingsViewController: AppSettingsMainViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.delegate = self
    }
    
    func notificationsMenuItemSwitch(param: UISwitch) {
        param.isOn ? print("notifications isOn") : print("notifications isOff")
    }
    
    func lightThemeMenuItemSwitch(param: UISwitch) {
        param.isOn ? print("lightTheme isOn") : print("lightTheme isOff")
    }
    
    func darkThemeMenuItemSwitch(param: UISwitch) {
        param.isOn ? print("darkTheme isOn") : print("darkTheme isOff")
    }
    
    func systemThemeMenuItemSwitch(param: UISwitch) {
        param.isOn ? print("systemTheme isOn") : print("systemTheme isOff")
    }
}
