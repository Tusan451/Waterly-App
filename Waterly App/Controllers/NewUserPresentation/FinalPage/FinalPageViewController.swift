//
//  FinalPageViewController.swift
//  Waterly App
//
//  Created by Olegio on 27.01.2023.
//

import UIKit

final class FinalPageViewController: BaseController {
    
    var mainView = FinalPageMainView()
}

extension FinalPageViewController {
    
    override func loadView() {
        super.loadView()
        
        view = mainView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        startPresentation()
    }
    
    override func configureViews() {
        super.configureViews()
        
        self.view.backgroundColor = Resources.Colors.Back.newUserPresentationBack
    }
}

private extension FinalPageViewController {
    
    func startPresentation() {
        let pageViewController = ModuleBuilder.configureNewUserPageModule(0)
        present(pageViewController, animated: true)
    }
}

extension FinalPageViewController: FinalPageMainViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.delegate = self
    }
    
    func maleRadioButtonDidPressed() {
        ///
    }
    
    func femaleRadioButtonDidPressed() {
        ///
    }
    
    func sliderChanged() {
        ///
    }
    
    func saveButtonAction() {
        let mainVC = MainViewController()
//        show(mainVC, sender: self)
        showDetailViewController(mainVC, sender: self)
    }
}
