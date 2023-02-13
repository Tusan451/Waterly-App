//
//  UserSettingsAssembley.swift
//  Waterly App
//
//  Created by Olegio on 07.02.2023.
//

import UIKit

protocol UserSettingsAssembleyInputProtocol {
    func configure() -> UIViewController
}

class UserSettingsAssembley: UserSettingsAssembleyInputProtocol {
    
    func configure() -> UIViewController {
        let viewController = UserSettingsViewController()
        let presenter = UserSettingsPresenter(viewController)
        let interactor = UserSettingsInteractor(presenter)
        let router = UserSettingsRouter(viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
        return viewController
    }
}
