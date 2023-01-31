//
//  SettingsMainView.swift
//  Waterly App
//
//  Created by Olegio on 30.01.2023.
//

import UIKit

protocol SettingsMainViewDelegate: AnyObject {
    
    func userSettingsMenuItemTapped()
    func appSettingsMenuItemTapped()
}

final class SettingsMainView: BaseView {
    
    weak var delegate: SettingsMainViewDelegate?
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProRegular(size: 20)
        label.textColor = Resources.Colors.Text.textMain
        return label
    }()
    
    let userInfoLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProRegular(size: 14)
        label.textColor = Resources.Colors.Text.textSecondary
        return label
    }()
    
    var userSettingsMenuItemButton = MenuItemButton()
    
    var appSettingsMenuItemButton = MenuItemButton()
    
    private let menuItemsStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 16
        return view
    }()
}

extension SettingsMainView {
    
    override func addViews() {
        super.addViews()
        
        addView(userNameLabel)
        addView(userInfoLabel)
        
        menuItemsStackView.addArrangedSubview(userSettingsMenuItemButton)
        menuItemsStackView.addArrangedSubview(appSettingsMenuItemButton)
        
        addView(menuItemsStackView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            userNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            userNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24),
            userNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            userNameLabel.bottomAnchor.constraint(equalTo: userInfoLabel.topAnchor, constant: -8),
            
            userInfoLabel.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor),
            userInfoLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 8),
            userInfoLabel.trailingAnchor.constraint(equalTo: userNameLabel.trailingAnchor),
            userInfoLabel.bottomAnchor.constraint(equalTo: menuItemsStackView.topAnchor, constant: -32),

            userSettingsMenuItemButton.heightAnchor.constraint(equalToConstant: 40),
            appSettingsMenuItemButton.heightAnchor.constraint(equalToConstant: 40),

            menuItemsStackView.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor),
            menuItemsStackView.topAnchor.constraint(equalTo: userInfoLabel.bottomAnchor, constant: 32),
            menuItemsStackView.trailingAnchor.constraint(equalTo: userNameLabel.trailingAnchor)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
//        userNameLabel.text = "Олег Федотов"
//        userInfoLabel.text = "31 год, 74 кг, 178 см"
        
        userSettingsMenuItemButton.addTarget(self,
                                             action: #selector(userSettingsMenuItemButtonAction),
                                             for: .touchUpInside)
        
        appSettingsMenuItemButton.addTarget(self,
                                             action: #selector(appSettingsMenuItemButtonAction),
                                             for: .touchUpInside)
    }
}

@objc extension SettingsMainView {
    
    func userSettingsMenuItemButtonAction() {
        delegate?.userSettingsMenuItemTapped()
    }
    
    func appSettingsMenuItemButtonAction() {
        delegate?.appSettingsMenuItemTapped()
    }
}
