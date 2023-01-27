//
//  ScreenPageViewController.swift
//  Waterly App
//
//  Created by Olegio on 26.01.2023.
//

import UIKit

final class ScreenPageViewController: BaseController {
    
    var mainView = ScreenPageMainView()
    var presenter: ScreenPagePresenterProtocol!
}

extension ScreenPageViewController {
    
    override func loadView() {
        super.loadView()
        
        view = mainView
    }
    
    override func configureViews() {
        super.configureViews()
        
        presenter.configureContent()
        
        self.view.backgroundColor = Resources.Colors.Back.newUserPresentationBack
    }
}

extension ScreenPageViewController: ScreenPageViewProtocol {
    func setContent(title: String, imageName: String, message: String) {
        mainView.titleLabel.text = title
        mainView.messageLabel.text = message
        mainView.imageView.image = UIImage(named: imageName)
    }
}
