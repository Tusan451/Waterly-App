//
//  UserSettingsAssembly.swift
//  Waterly App
//
//  Created by Olegio on 02.02.2023.
//

import UIKit

protocol UserSettingsAssemblyInputProtocol {
    func configure() -> UIViewController
}

class UserSettingsAssembly: UserSettingsAssemblyInputProtocol {
    
    func configure() -> UIViewController {
        let viewController = UserSettingsViewController()
//        let presenter = AppSettingsPresenter(viewController)
//        let interactor = AppSettingsInteractor(presenter)
        
//        viewController.presenter = presenter
//        presenter.interactor = interactor
        
        return viewController
    }
}
