//
//  TabBarController.swift
//  Waterly App
//
//  Created by Olegio on 26.12.2022.
//

import UIKit

enum Tabs: Int {
    case statistics
    case main
    case settings
}

final class TabBarController: UITabBarController {
    
    private var customTabBarView = UIView(frame: .zero)
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configureTabs()
        switchTo(tab: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBarUI()
        addCustomTabBarView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupCustomTabBarFrame()
    }
    
    private func switchTo(tab: Tabs) {
        selectedIndex = tab.rawValue
    }
    
    private func setupCustomTabBarFrame() {
        let height = view.safeAreaInsets.bottom + 56
        
        var tabFrame = tabBar.frame
        tabFrame.size.height = height
        tabFrame.origin.y = view.frame.size.height - height
        
        tabBar.frame = tabFrame
        tabBar.setNeedsLayout()
        tabBar.layoutIfNeeded()
        
        customTabBarView.frame = tabBar.frame
    }
    
    private func setupTabBarUI() {
        tabBar.backgroundColor = Resources.Colors.Back.tabBarBackColor
        tabBar.layer.cornerRadius = 30
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabBar.tintColor = Resources.Colors.Accent.accentMain
        
        if #available(iOS 13.0, *) {
            let appearence = tabBar.standardAppearance
            appearence.stackedLayoutAppearance.normal.titleTextAttributes = [
                .foregroundColor: Resources.Colors.Accent.accentInactive as Any
            ]
            appearence.stackedLayoutAppearance.normal.iconColor = Resources.Colors.Accent.accentInactive
            appearence.shadowImage = nil
            appearence.shadowColor = nil
            appearence.backgroundColor = Resources.Colors.Back.tabBarBackColor
            tabBar.standardAppearance = appearence
        } else {
            tabBar.shadowImage = UIImage()
            tabBar.backgroundImage = UIImage()
        }
    }
    
    private func addCustomTabBarView() {
        customTabBarView.frame = tabBar.frame
        
        customTabBarView.backgroundColor = Resources.Colors.Back.tabBarBackColor
        customTabBarView.layer.cornerRadius = 30
        customTabBarView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        customTabBarView.layer.masksToBounds = false
        customTabBarView.layer.shadowColor = Resources.Colors.Other.shadow?.cgColor
        customTabBarView.layer.shadowOffset = Resources.Shadows.TabBar.offset
        customTabBarView.layer.shadowOpacity = Resources.Shadows.TabBar.opacity
        customTabBarView.layer.shadowRadius = Resources.Shadows.TabBar.radius
        
        view.addSubview(customTabBarView)
        view.bringSubviewToFront(tabBar)
    }
    
    private func configureTabs() {
        let statisticsController = StatisticsViewController()
        let mainController = MainViewController()
        let settingsController = SettingsViewController()
        
        let settingsNavController = NavBarController(rootViewController: settingsController)
        let statisticNavController = NavBarController(rootViewController: statisticsController)
        let mainNavController = NavBarController(rootViewController: mainController)
        
        statisticNavController.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.statistics,
                                                       image: Resources.Images.TabBar.statistics,
                                                       tag: Tabs.statistics.rawValue)
        
        mainNavController.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.main,
                                                 image: Resources.Images.TabBar.main,
                                                 tag: Tabs.main.rawValue)
        
        settingsNavController.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.settings,
                                                        image: Resources.Images.TabBar.settings,
                                                        tag: Tabs.settings.rawValue)
        
        setViewControllers([
            statisticNavController,
            mainNavController,
            settingsNavController
        ], animated: false)
    }
}
