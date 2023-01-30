//
//  SettingsViewController.swift
//  Waterly App
//
//  Created by Olegio on 26.12.2022.
//

import UIKit

class SettingsViewController: BaseController {
    
    
}

extension SettingsViewController {
    
    override func addViews() {
        super.addViews()
    }
    
    override func configureViews() {
        super.configureViews()
        
        navigationBarConfigure()
    }
}

private extension SettingsViewController {
    
    func navigationBarConfigure() {
        title = Resources.Strings.SettingsModule.mainControllerTitle
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.settings
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
