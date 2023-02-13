//
//  UserSettingsViewController.swift
//  Waterly App
//
//  Created by Olegio on 02.02.2023.
//

import UIKit

final class UserSettingsViewController: BaseController {
    
    var mainView = UserSettingsMainView()
    var presenter: UserSettingsViewOutputProtocol!
}

extension UserSettingsViewController {
    
    override func loadView() {
        super.loadView()
        
        view = mainView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        configureSaveButtonState()
    }
    
    override func configureViews() {
        super.configureViews()
        navigationItem.largeTitleDisplayMode = .never
        
        presenter.provideDefaultLabelsSettings()
    }
}

private extension UserSettingsViewController {
    
    // Configure Save Button State
    func configureSaveButtonState() {
        presenter.provideSaveButtonStateWith(
            nameValue: mainView.nameTextFieldView.getCurrentTextFieldText(),
            ageValue: mainView.ageTextFieldView.getCurrentTextFieldText(),
            heightValue: mainView.heightTextFieldView.getCurrentTextFieldText(),
            weightValue: mainView.weightTextFieldView.getCurrentTextFieldText()
        )
    }
}

extension UserSettingsViewController: UserSettingsMainViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.delegate = self
    }
    
    func maleRadioButtonDidPressed() {
        presenter.maleRButtonDidPressed()
        print(mainView.selectGenderView.femaleRadioButton.state)
        print(mainView.selectGenderView.maleRadioButton.state)
        view.setNeedsLayout()
    }
    
    func femaleRadioButtonDidPressed() {
        presenter.femaleRButtonDidPressed()
        print(mainView.selectGenderView.femaleRadioButton.state)
        print(mainView.selectGenderView.maleRadioButton.state)
        view.setNeedsLayout()
    }
    
    func sliderChanged() {
        presenter.sliderValueDidChanged(
            to: mainView.physicalActivityView.physicalActivitySlider.value
        )
    }
    
    func saveButtonAction() {
        print("saveButtonDidPressed")
        presenter.saveButtonDidPressed(
            name: mainView.nameTextFieldView.getCurrentTextFieldText(),
            male: mainView.selectGenderView.maleRadioButton.getState(),
            female: mainView.selectGenderView.femaleRadioButton.getState(),
            age: mainView.ageTextFieldView.getCurrentTextFieldText(),
            height: mainView.heightTextFieldView.getCurrentTextFieldText(),
            weight: mainView.weightTextFieldView.getCurrentTextFieldText(),
            activity: mainView.physicalActivityView.physicalActivitySlider.value
        )
    }
}

// MARK: - UserSettingsViewInputProtocol

extension UserSettingsViewController: UserSettingsViewInputProtocol {
    func setScreenTitle(_ title: String) {
        self.title = title
    }
    
    func configureNameTextField(_ title: String, _ value: String?) {
        mainView.nameTextFieldView.titleLabel.text = title
        mainView.nameTextFieldView.textField.viewModel = BaseTextFieldViewModel(
            text: value,
            placeholder: nil,
            valueText: nil
        )
    }
    
    func configureAgeTextField(
        _ title: String,
        _ value: String?,
        _ placeholder: String) {
        
            mainView.ageTextFieldView.titleLabel.text = title
            mainView.ageTextFieldView.textField.viewModel = BaseTextFieldViewModel(
                text: value,
                placeholder: nil,
                valueText: placeholder
            )
    }
    
    func configureHeightTextField(
        _ title: String,
        _ value: String?,
        _ placeholder: String) {
        
            mainView.heightTextFieldView.titleLabel.text = title
            mainView.heightTextFieldView.textField.viewModel = BaseTextFieldViewModel(
                text: value,
                placeholder: nil,
                valueText: placeholder
            )
    }
    
    func configureWeightTextField(
        _ title: String,
        _ value: String?,
        _ placeholder: String) {
        
            mainView.weightTextFieldView.titleLabel.text = title
            mainView.weightTextFieldView.textField.viewModel = BaseTextFieldViewModel(
                text: value,
                placeholder: nil,
                valueText: placeholder
            )
    }
    
    func setGenderTitle(_ title: String) {
        mainView.selectGenderView.titleLabel.text = title
    }
    
    func setMaleTitle(_ title: String) {
        mainView.selectGenderView.maleLabel.text = title
    }
    
    func setFemaleTitle(_ title: String) {
        mainView.selectGenderView.femaleLabel.text = title
    }
    
    func setActivityTitle(_ title: String) {
        mainView.physicalActivityView.titleLabel.text = title
    }
    
    func setButtonTitle(_ title: String) {
        mainView.saveButton.setTitle(with: title)
    }
    
    func setDisclaimer(_ disclaimer: String) {
        mainView.disclaimerLabel.text = disclaimer
    }
    
    func setUpdatedActivityLabel(with title: String, and color: SliderColor) {
        mainView.physicalActivityView.physicalActivityLabel.text = title
        switch color {
        case .yellow:
            mainView.physicalActivityView.physicalActivityLabel.textColor =
            Resources.Colors.Other.yellow
            mainView.physicalActivityView.physicalActivitySlider.minimumTrackTintColor =
            Resources.Colors.Other.yellow
        case .green:
            mainView.physicalActivityView.physicalActivityLabel.textColor =
            Resources.Colors.Other.green
            mainView.physicalActivityView.physicalActivitySlider.minimumTrackTintColor =
            Resources.Colors.Other.green
        case .red:
            mainView.physicalActivityView.physicalActivityLabel.textColor =
            Resources.Colors.Other.red
            mainView.physicalActivityView.physicalActivitySlider.minimumTrackTintColor =
            Resources.Colors.Other.red
        }
    }
    
    func setSaveButtonState(with state: ButtonState) {
        state == .on ? mainView.saveButton.turnOn() :
        mainView.saveButton.turnOff()
    }
    
    func setRButtonsStates(male: RadioButtonState, female: RadioButtonState) {
        mainView.selectGenderView.maleRadioButton.switchState(to: male)
        mainView.selectGenderView.femaleRadioButton.switchState(to: female)
        print(female)
        print(male)
    }
}

extension UserSettingsViewController: UITextFieldDelegate {
    
    // Hide keybord on tap on the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
