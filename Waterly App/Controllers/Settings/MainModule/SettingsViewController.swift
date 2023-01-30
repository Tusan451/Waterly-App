//
//  SettingsViewController.swift
//  Waterly App
//
//  Created by Olegio on 26.12.2022.
//

import UIKit

class SettingsViewController: BaseController {
    
    var mainView = SettingsMainView()
}

extension SettingsViewController {
    
    override func loadView() {
        view = mainView
    }
    
    override func addViews() {
        super.addViews()
    }
    
    override func configureViews() {
        super.configureViews()
        
        navigationBarConfigure()
    }
}

extension SettingsViewController: SettingsMainViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.delegate = self
    }
    
    func userSettingsMenuItemTapped() {
        print("userSettingsMenuItemTapped")
    }
    
    func appSettingsMenuItemTapped() {
        print("appSettingsMenuItemTapped")
    }
}

private extension SettingsViewController {
    
    func navigationBarConfigure() {
        title = Resources.Strings.SettingsModule.mainControllerTitle
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.settings
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
