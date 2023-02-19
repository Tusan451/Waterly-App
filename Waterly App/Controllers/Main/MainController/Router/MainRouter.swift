//
//  MainRouter.swift
//  Waterly App
//
//  Created by Olegio on 15.02.2023.
//

import UIKit

protocol MainRouterInputProtocol {
    init(_ viewController: UIViewController)
    func goToAddDayGoalModule()
    func goToAddWaterModule()
}

class MainRouter: MainRouterInputProtocol {
    unowned let viewController: UIViewController
    
    required init(_ viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func goToAddDayGoalModule() {
        let viewController = self.viewController as! MainViewController
        let addDayGoalVc = ModuleBuilder.configureAddDayGoalModule(viewController)
        viewController.present(addDayGoalVc, animated: true)
    }
    
    func goToAddWaterModule() {
        let viewController = self.viewController as! MainViewController
        let addWaterVc = ModuleBuilder.configureAddWaterModule(viewController)
        viewController.present(addWaterVc, animated: true)
    }
}
