//
//  AddWaterViewController.swift
//  Waterly App
//
//  Created by Olegio on 16.01.2023.
//

import UIKit

final class AddWaterViewController: BaseController {
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    weak var delegate: ModalViewControllerDelegate?
    
    var mainView = AddWaterMainView()
    
    var presenter: AddWaterPresenterProtocol!
}

extension AddWaterViewController {
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        configureDailyPercentLabel()
        configureCurrentProgressLabels()
        configureSaveButtonState()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.modalControllerWillDisapear(self)
    }
    
    override func configureViews() {
        super.configureViews()
        
        presenter.setViewTitle()
        presenter.setTextFieldTextValues()
        presenter.setDailyPercentViewTitle()
        presenter.setDismissButtonTitle()
        presenter.setSaveButtonTitle()
        presenter.configureCurrentProgressViewTitle()
        presenter.setCurrentProgressViewValue()
    }
}

extension AddWaterViewController: AddWaterMainViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.delegate = self
    }
    
    func dismissButtonDidPressed() {
        dismiss(animated: true)
        
        appDelegate?.scheduleNotification(notificationType: "Вы не добавили воду!")
    }
    
    func saveButtonDidPressed() {
        presenter.saveButtonPressed(mainView.getTextFieldView().getCurrentTextFieldText())
    }
}

private extension AddWaterViewController {
    
    // Configure Daily Percent Label
    func configureDailyPercentLabel() {
        presenter.configureDailyPercentViewValue(mainView.getTextFieldView().getCurrentTextFieldText())
    }
    
    // Configure Current Progress Labels
    func configureCurrentProgressLabels() {
        presenter.configureCurrentProgressViewFor(value: mainView.getTextFieldView().getCurrentTextFieldText())
    }
    
    // Configure Save Button State
    func configureSaveButtonState() {
        presenter.setSaveButtonStateFor(mainView.getTextFieldView().getCurrentTextFieldText())
    }
}

extension AddWaterViewController: AddWaterViewProtocol {
    
    func setMainTitle(title: String) {
        mainView.getTitleLabel().text = title
    }
    
    func setTextFieldTextValues(title: String, placeholder: String, valuePlaceholder: String) {
        mainView.getTextFieldView().titleLabel.text = title
        mainView.getTextFieldView().textField.viewModel = BaseTextFieldViewModel(
            text: nil,
            placeholder: placeholder,
            valueText: valuePlaceholder
        )
    }
    
    func setDismissButtonTitle(title: String) {
        mainView.getDismissButton().setTitle(with: title)
    }
    
    func setActionButtonTitle(title: String) {
        mainView.getSaveButton().setTitle(with: title)
    }
    
    func setDailyPercentViewTitle(title: String) {
        mainView.getDailyPercentView().textLabel.text = title
    }
    
    func setDailyPercentViewValue(value: String, state: DailyPercentValueState) {
        mainView.getDailyPercentView().valueLabel.text = value
        switch state {
        case .notFocus:
            mainView.getDailyPercentView().valueLabel.textColor = Resources.Colors.Text.textTertiary
        case .focus:
            mainView.getDailyPercentView().valueLabel.textColor = Resources.Colors.Text.textMain
        }
    }
    
    func setCurrentProgressViewTitle(title: String) {
        mainView.getCurrentProgressView().textLabel.text = title
    }
    
    func setCurrentProgressViewValue(value: String) {
        mainView.getCurrentProgressView().currentValueLabel.text = value
    }
    
    func setCurrentProgressViewValueFor(newValue: String?, arrowState: ArrowState) {
        mainView.getCurrentProgressView().newValueLabel.text = newValue
        switch arrowState {
        case .isHidden:
            mainView.getCurrentProgressView().arrowView.isHidden = true
        case .show:
            mainView.getCurrentProgressView().arrowView.isHidden = false
        }
    }
    
    func setSaveButtonState(state: Resources.SaveButtonState) {
        state == .turnOn ? mainView.getSaveButton().turnOn() : mainView.getSaveButton().turnOff()
    }
    
    func clearTextFieldText(placeholder: String?) {
        mainView.getTextFieldView().textField.viewModel.text = nil
        mainView.getTextFieldView().textField.viewModel.placeholder = placeholder
    }
    
    func showAlert(title: String, message: String, okButtonTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: okButtonTitle,
                                     style: .default)

        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func dismiss() {
        dismiss(animated: true)
    }
}

extension AddWaterViewController: UITextFieldDelegate {
    
    // Hide keybord on tap on the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
