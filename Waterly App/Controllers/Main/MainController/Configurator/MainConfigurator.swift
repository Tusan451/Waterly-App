//
//  MainConfigurator.swift
//  Waterly App
//
//  Created by Olegio on 09.02.2023.
//

import UIKit

protocol MainConfiguratorInputProtocol {
    func configure() -> UIViewController
}

class MainConfigurator: MainConfiguratorInputProtocol {
    
    func configure() -> UIViewController {
        let viewController = MainViewController()
        let presenter = MainPresenter(viewController)
        let interactor = MainInteractor(presenter)
        let router = MainRouter(viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
        return viewController
    }
}
