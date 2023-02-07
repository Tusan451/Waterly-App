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
    
    class func configureNewUserPageModule(_ targetPageIndex: Int) -> UIPageViewController {
        var arrayOfVc = [UIViewController]()
        let firstPageVc = ModuleBuilder.configureNewUserFirstPageModule()
        let secondPageVc = ModuleBuilder.configureNewUserScreenPageModule(
            title: Resources.Strings.NewUserPageVC.SecondPage.title,
            message: Resources.Strings.NewUserPageVC.SecondPage.message,
            imageName: Resources.Strings.NewUserPageVC.SecondPage.image
        )
        let thirdPageVc = ModuleBuilder.configureNewUserScreenPageModule(
            title: Resources.Strings.NewUserPageVC.ThirdPage.title,
            message: Resources.Strings.NewUserPageVC.ThirdPage.message,
            imageName: Resources.Strings.NewUserPageVC.ThirdPage.image
        )
        let fourthPageVc = ModuleBuilder.configureNewUserScreenPageModule(
            title: Resources.Strings.NewUserPageVC.FourthPage.title,
            message: Resources.Strings.NewUserPageVC.FourthPage.message,
            imageName: Resources.Strings.NewUserPageVC.FourthPage.image
        )
        let fivePageVc = ModuleBuilder.configureNewUserScreenPageModule(
            title: Resources.Strings.NewUserPageVC.FivePage.title,
            message: Resources.Strings.NewUserPageVC.FivePage.message,
            imageName: Resources.Strings.NewUserPageVC.FivePage.image
        )
        
        arrayOfVc.append(firstPageVc)
        arrayOfVc.append(secondPageVc)
        arrayOfVc.append(thirdPageVc)
        arrayOfVc.append(fourthPageVc)
        arrayOfVc.append(fivePageVc)
        
        let pageViewController = NewUserPageViewController(array: arrayOfVc, targetPageIndex: targetPageIndex)
        return pageViewController
    }
    
    class func configureNewUserFirstPageModule() -> UIViewController {
        let viewController = FirstPageVC()
        let presenter = FirstPagePresenter(view: viewController)
        viewController.presenter = presenter
        return viewController
    }
    
    class func configureNewUserScreenPageModule(title: String, message: String, imageName: String) -> UIViewController {
        let viewController = ScreenPageViewController()
        let presenter = ScreenPagePresenter(view: viewController,
                                            title: title,
                                            imageName: imageName,
                                            message: message)
        viewController.presenter = presenter
        return viewController
    }
}
