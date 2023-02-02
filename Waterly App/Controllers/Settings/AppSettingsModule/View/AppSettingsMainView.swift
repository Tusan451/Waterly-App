//
//  AppSettingsMainView.swift
//  Waterly App
//
//  Created by Olegio on 31.01.2023.
//

import UIKit

protocol AppSettingsMainViewDelegate: AnyObject {
    
    func notificationsMenuItemSwitch(param: UISwitch)
    func lightThemeMenuItemSwitch(param: UISwitch)
    func darkThemeMenuItemSwitch(param: UISwitch)
    func systemThemeMenuItemSwitch(param: UISwitch)
}

final class AppSettingsMainView: BaseView {
    
    weak var delegate: AppSettingsMainViewDelegate?
    
    let notificationsMenuItemView = AppSettingsMenuItemView()
    let lightThemeMenuItemView = AppSettingsMenuItemView()
    let darkThemeMenuItemView = AppSettingsMenuItemView()
    let systemThemeMenuItemView = AppSettingsMenuItemView()
    
    private let menuItemsStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 32
        return view
    }()
}

extension AppSettingsMainView {
    
    override func addViews() {
        super.addViews()
        
        menuItemsStackView.addArrangedSubview(notificationsMenuItemView)
        menuItemsStackView.addArrangedSubview(lightThemeMenuItemView)
        menuItemsStackView.addArrangedSubview(darkThemeMenuItemView)
        menuItemsStackView.addArrangedSubview(systemThemeMenuItemView)
        
        addView(menuItemsStackView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            menuItemsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            menuItemsStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            menuItemsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
//        notificationsMenuItemView.setMainTitle(
//            Resources.Strings.SettingsModule.AppSettingsModule.notificationsMainTitle
//        )
//        notificationsMenuItemView.setSecondaryTitle(
//            Resources.Strings.SettingsModule.AppSettingsModule.notificationsSecondaryTitle
//        )
//        
//        lightThemeMenuItemView.setMainTitle(
//            Resources.Strings.SettingsModule.AppSettingsModule.lightThemeMainTitle
//        )
//        
//        darkThemeMenuItemView.setMainTitle(
//            Resources.Strings.SettingsModule.AppSettingsModule.darkThemeMainTitle
//        )
//        
//        systemThemeMenuItemView.setMainTitle(
//            Resources.Strings.SettingsModule.AppSettingsModule.systemThemeMainTitle
//        )
                
        notificationsMenuItemView.menuItemSwitch.addTarget(
            self,
            action: #selector(notificationsMenuItemAction),
            for: .valueChanged
        )
        
        lightThemeMenuItemView.menuItemSwitch.addTarget(
            self,
            action: #selector(lightThemeMenuItemAction),
            for: .valueChanged
        )
        
        darkThemeMenuItemView.menuItemSwitch.addTarget(
            self,
            action: #selector(darkThemeMenuItemAction),
            for: .valueChanged
        )
        
        systemThemeMenuItemView.menuItemSwitch.addTarget(
            self,
            action: #selector(systemThemeMenuItemAction),
            for: .valueChanged
        )
    }
}

@objc extension AppSettingsMainView {
    
    func notificationsMenuItemAction(param: UISwitch) {
        delegate?.notificationsMenuItemSwitch(param: param)
    }
    
    func lightThemeMenuItemAction(param: UISwitch) {
        delegate?.lightThemeMenuItemSwitch(param: param)
    }
    
    func darkThemeMenuItemAction(param: UISwitch) {
        delegate?.darkThemeMenuItemSwitch(param: param)
    }
    
    func systemThemeMenuItemAction(param: UISwitch) {
        delegate?.systemThemeMenuItemSwitch(param: param)
    }
}
