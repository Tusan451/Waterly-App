//
//  SceneDelegate.swift
//  Waterly App
//
//  Created by Olegio on 26.12.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        let tabBarController = TabBarController()
        let pageViewController = ModuleBuilder.configureNewUserPageModule()
        
        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = pageViewController
        window?.makeKeyAndVisible()
    }
    
//    private func configurePageViewController() -> UIPageViewController {
//
//        var arrayOfVc = [UIViewController]()
//        let firstPageVc = ModuleBuilder.configureNewUserFirstPageModule()
//        arrayOfVc.append(firstPageVc)
//
//        return ModuleBuilder.configureNewUserPageModule(arrayOfViewControllers: arrayOfVc)
//    }
}

