//
//  UserSettingsRouter.swift
//  Waterly App
//
//  Created by Olegio on 08.02.2023.
//

import UIKit

protocol UserSettingsRouterInputProtocol {
    init(_ viewController: UIViewController)
    func showAlert(title: String, message: String?, actionTitle: String)
}

class UserSettingsRouter: UserSettingsRouterInputProtocol {
    unowned let viewController: UIViewController
    
    required init(_ viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func showAlert(title: String, message: String?, actionTitle: String) {
        let viewController = self.viewController as! UserSettingsViewController
        let targetTab: Tabs = .main
        let alert = ConfigAlertService.shared.configureAlert(
            title: title,
            message: message,
            actionTitle: actionTitle) { _ in
                viewController.tabBarController?.selectedIndex = targetTab.rawValue
                viewController.navigationController?.popViewController(animated: false)
            }
        
        viewController.present(alert, animated: true)
    }
}
