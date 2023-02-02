//
//  AppSettingsAssembly.swift
//  Waterly App
//
//  Created by Olegio on 01.02.2023.
//

import UIKit

protocol AppSettingsAssemblyInputProtocol {
    func configure() -> UIViewController
}

class AppSettingsModuleAssambly: AppSettingsAssemblyInputProtocol {
    
    func configure() -> UIViewController {
        let viewController = AppSettingsViewController()
        let presenter = AppSettingsPresenter(viewController)
        let interactor = AppSettingsInteractor(presenter)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        
        return viewController
    }
}
