//
//  Assambly.swift
//  Waterly App
//
//  Created by Olegio on 21.01.2023.
//

import UIKit

class ModuleBuilder {
    
    class func configureAddDayGoalModule(_ delegate: UIViewController) -> UIViewController {
        let viewController = AddDayGoalViewController()
        let viewModel = AddDayGoalViewModel()
        viewController.delegate = delegate as? any ModalViewControllerDelegate
        viewController.addDayGoalViewModel = viewModel
        return viewController
    }
    
    class func configureAddWaterModule(_ delegate: UIViewController) -> UIViewController {
        let viewController = AddWaterViewController()
        viewController.delegate = delegate as? any ModalViewControllerDelegate
        let presenter = AddWaterPresenter(view: viewController)
        viewController.presenter = presenter
        return viewController
    }
}
