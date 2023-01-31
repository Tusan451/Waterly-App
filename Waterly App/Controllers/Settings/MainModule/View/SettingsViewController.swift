//
//  SettingsViewController.swift
//  Waterly App
//
//  Created by Olegio on 26.12.2022.
//

import UIKit

class SettingsViewController: BaseController {
    
    var mainView = SettingsMainView()
    
    var presenter: SettingsViewOutputProtocol!
}

extension SettingsViewController {
    
    override func loadView() {
        view = mainView
    }
    
    override func addViews() {
        super.addViews()
    }
    
    override func configureViews() {
        super.configureViews()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        presenter.provideUserData()
        presenter.provideAppMenuItemData()
        presenter.provideUserMenuItemData()
        presenter.provideTabBarTitle()
        presenter.provideNavigationBarTitle()
    }
}

// MARK: - SettingsMainViewDelegate

extension SettingsViewController: SettingsMainViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.delegate = self
    }
    
    func userSettingsMenuItemTapped() {
        presenter.didTapUserSettingsMenuItem()
    }
    
    func appSettingsMenuItemTapped() {
        presenter.didTapAppSettingsMenuItem()
    }
}

// MARK: - SettingsViewInputProtocol

extension SettingsViewController: SettingsViewInputProtocol {

    func setUserName(_ userName: String) {
        mainView.userNameLabel.text = userName
    }
    
    func setUserInfo(_ userInfo: String) {
        mainView.userInfoLabel.text = userInfo
    }
    
    func setUserSettingsMenuItem(title: String, imageName: String) {
        mainView.userSettingsMenuItemButton.setButtonTitle(title)
        mainView.userSettingsMenuItemButton.setButtonIcon(imageName)
    }
    
    func setAppSettingsMenuItem(title: String, imageName: String) {
        mainView.appSettingsMenuItemButton.setButtonTitle(title)
        mainView.appSettingsMenuItemButton.setButtonIcon(imageName)
    }
    
    func setNavigationBarTitle(navBarTitle: String) {
        title = navBarTitle
    }
    
    func setTabBarTitle(title: String) {
        navigationController?.tabBarItem.title = title
    }
    
    func performUserSettingsMenuItemAction(with message: String) {
        print(message)
    }
    
    func performAppSettingsMenuItemAction(with message: String) {
        print(message)
    }
}
