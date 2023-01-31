//
//  SettingsAssamblyInputProtocol.swift
//  Waterly App
//
//  Created by Olegio on 31.01.2023.
//

import UIKit

protocol SettingsAssamblyInputProtocol {
    func configure() -> UIViewController
}

class SettingsModuleAssambly: SettingsAssamblyInputProtocol {
    
    func configure() -> UIViewController {
        let viewController = SettingsViewController()
        let presenter = SettingsPresenter(view: viewController)
        let interactor = SettingsInteractor(presenter: presenter)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        
        return viewController
    }
}
