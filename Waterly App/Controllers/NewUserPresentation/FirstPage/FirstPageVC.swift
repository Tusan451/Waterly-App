//
//  FirstPageVC.swift
//  Waterly App
//
//  Created by Olegio on 25.01.2023.
//

import UIKit

final class FirstPageVC: BaseController {
    
    var mainView = FirstPageVCMainView()
    var presenter: FirstPagePresenterProtocol!
}

extension FirstPageVC {
    
    override func loadView() {
        view = mainView
    }
    
    override func configureViews() {
        super.configureViews()
        
        presenter.setIcon()
        presenter.setMainTitle()
        presenter.setSecondaryTitle()
        presenter.setAuthorTitle()
        
        self.view.backgroundColor = Resources.Colors.Back.newUserPresentationBack
    }
}

extension FirstPageVC: FirstPageViewProtocol {
    
    func getIcon(name: String) {
        guard let iconImage = UIImage(named: name) else { return }
        mainView.iconView.image = iconImage
    }
    
    func getMainTitle(text: String) {
        mainView.mainLabel.text = text
    }
    
    func getSecondaryTitle(text: String) {
        mainView.secondaryLabel.text = text
    }
    
    func getAuthorTitle(text: String) {
        mainView.authorLabel.text = text
    }
}
