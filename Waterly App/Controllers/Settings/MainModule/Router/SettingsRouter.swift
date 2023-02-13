//
//  SettingsRouter.swift
//  Waterly App
//
//  Created by Olegio on 01.02.2023.
//

import UIKit

protocol SettingsRouterInputProtocol {
    init(_ viewController: UIViewController)
    func goToAppSettingsModule()
    func goToUserSettingsModule()
}

class SettingsRouter: SettingsRouterInputProtocol {
    
    unowned let viewController: UIViewController
    
    required init(_ viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func goToAppSettingsModule() {
        let appSettingsAssemblyModule: AppSettingsAssemblyInputProtocol = AppSettingsModuleAssambly()
        let appSettingsVc = appSettingsAssemblyModule.configure()
        let viewController = self.viewController as! SettingsViewController
        viewController.navigationController?.pushViewController(appSettingsVc, animated: true)
    }
    
    func goToUserSettingsModule() {
        let userSettingsAssemblyModule: UserSettingsAssembleyInputProtocol = UserSettingsAssembley()
        let userSettingsVc = userSettingsAssemblyModule.configure()
        let viewController = self.viewController as! SettingsViewController
        viewController.navigationController?.pushViewController(userSettingsVc, animated: true)
    }
}
