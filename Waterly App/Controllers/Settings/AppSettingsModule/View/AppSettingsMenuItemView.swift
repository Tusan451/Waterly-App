//
//  AppSettingsMenuItemView.swift
//  Waterly App
//
//  Created by Olegio on 31.01.2023.
//

import UIKit

final class AppSettingsMenuItemView: BaseView {
    
    let mainTitleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProRegular(size: 16)
        label.textColor = Resources.Colors.Text.textMain
        return label
    }()
    
    let secondaryTitleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProMedium(size: 10)
        label.textColor = Resources.Colors.Text.textSecondary
        label.numberOfLines = 0
        return label
    }()
    
    let menuItemSwitch: UISwitch = {
        let menuSwitch = UISwitch()
        menuSwitch.tintColor = Resources.Colors.Back.backSecondary
        menuSwitch.onTintColor = Resources.Colors.Accent.accentMain
        return menuSwitch
    }()
    
    func setMainTitle(_ title: String) {
        self.mainTitleLabel.text = title
    }
    
    func setSecondaryTitle(_ title: String?) {
        self.secondaryTitleLabel.text = title
    }
}

extension AppSettingsMenuItemView {
    
    override func addViews() {
        super.addViews()
        
        addView(mainTitleLabel)
        addView(secondaryTitleLabel)
        addView(menuItemSwitch)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            mainTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainTitleLabel.topAnchor.constraint(equalTo: topAnchor),
            mainTitleLabel.trailingAnchor.constraint(equalTo: menuItemSwitch.leadingAnchor, constant: -24),
            mainTitleLabel.bottomAnchor.constraint(equalTo: secondaryTitleLabel.topAnchor, constant: -6),
            
            secondaryTitleLabel.widthAnchor.constraint(equalToConstant: 185),
            secondaryTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            secondaryTitleLabel.topAnchor.constraint(equalTo: mainTitleLabel.bottomAnchor, constant: 6),
            secondaryTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            menuItemSwitch.leadingAnchor.constraint(equalTo: mainTitleLabel.trailingAnchor, constant: 24),
            menuItemSwitch.centerYAnchor.constraint(equalTo: centerYAnchor),
            menuItemSwitch.trailingAnchor.constraint(equalTo: trailingAnchor),
            menuItemSwitch.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
}
