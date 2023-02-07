//
//  UserSettingsViewController.swift
//  Waterly App
//
//  Created by Olegio on 02.02.2023.
//

import UIKit

final class UserSettingsViewController: BaseController {
    
    var mainView = UserSettingsMainView()
}

extension UserSettingsViewController {
    
    override func loadView() {
        super.loadView()
        
        view = mainView
    }
    
    override func configureViews() {
        super.configureViews()
        navigationItem.largeTitleDisplayMode = .never
        title = Resources.Strings.SettingsModule.mainControllerUserSettingsTitle
    }
}

extension UserSettingsViewController: UserSettingsMainViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.delegate = self
    }
    
    func maleRadioButtonDidPressed() {
        print("maleRadioButtonDidPressed")
    }
    
    func femaleRadioButtonDidPressed() {
        print("femaleRadioButtonDidPressed")
    }
    
    func sliderChanged() {
        print(mainView.physicalActivityView.physicalActivitySlider.value)
    }
    
    func saveButtonAction() {
        print("saveButtonDidPressed")
    }
}

extension UserSettingsViewController: UITextFieldDelegate {
    
    // Hide keybord on tap on the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
