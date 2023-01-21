//
//  AddDayGoalAssambly.swift
//  Waterly App
//
//  Created by Olegio on 21.01.2023.
//

import UIKit

class AddDayGoalAssambly {
    
    class func configuredModule(_ delegate: UIViewController) -> AddDayGoalViewController {
        
        let viewController = AddDayGoalViewController()
        let viewModel = AddDayGoalViewModel()

        viewController.delegate = delegate as? any ModalViewControllerDelegate
        viewController.addDayGoalViewModel = viewModel

        return viewController
    }
}
