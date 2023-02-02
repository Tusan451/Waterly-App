//
//  SettingsRouter.swift
//  Waterly App
//
//  Created by Olegio on 01.02.2023.
//

import Foundation

protocol SettingsRouterInputProtocol {
    init(_ viewController: SettingsViewController)
    func goToAppSettingsModule()
}

class SettingsRouter: SettingsRouterInputProtocol {
    
    unowned let viewController: SettingsViewController
    
    required init(_ viewController: SettingsViewController) {
        self.viewController = viewController
    }
    
    func goToAppSettingsModule() {
        let appSettingsAssemblyModule: AppSettingsAssemblyInputProtocol = AppSettingsModuleAssambly()
        let appSettingsVc = appSettingsAssemblyModule.configure()
        viewController.navigationController?.pushViewController(appSettingsVc, animated: true)
    }
}
