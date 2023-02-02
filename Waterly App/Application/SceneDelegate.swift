//
//  SceneDelegate.swift
//  Waterly App
//
//  Created by Olegio on 26.12.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow? {
        didSet {
            window?.overrideUserInterfaceStyle = setTheme()
        }
    }
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        let tabBarController = TabBarController()
        
        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}

// MARK: - Private extension

private extension SceneDelegate {
    
    func setTheme() -> UIUserInterfaceStyle {
        
        let currentTheme = DataManager.shared.getTheme()
        
        var appTheme: UIUserInterfaceStyle = .unspecified
        
        switch currentTheme {
        case 0:
            appTheme = .unspecified
        case 1:
            appTheme = .light
        case 2:
            appTheme = .dark
        default:
            break
        }
        
        return appTheme
    }
}

