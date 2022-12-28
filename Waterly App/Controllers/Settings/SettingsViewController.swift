//
//  SettingsViewController.swift
//  Waterly App
//
//  Created by Olegio on 26.12.2022.
//

import UIKit

class SettingsViewController: BaseController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLeftAlignForTitle(text: Resources.Strings.TabBar.settings,
                             font: Resources.Fonts.sfProSemibold(size: 32),
                             textColor: Resources.Colors.Text.textMain)
    }
}
