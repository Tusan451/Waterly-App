//
//  AddDayGoalViewController.swift
//  Waterly App
//
//  Created by Olegio on 13.01.2023.
//

import UIKit

final class AddDayGoalViewController: BaseController {
        
    weak var delegate: ModalViewControllerDelegate?
    
    var addDayGoalMainView = AddDayGoalMainView()
    
    var addDayGoalViewModel: AddDayGoalViewModelProtocol! {
        didSet {
            addDayGoalViewModel.viewDidChange = { [unowned self] refreshViewModel in
                switch refreshViewModel.alert {
                case .littleValue:
                    showAlert(
                        title: refreshViewModel.alertLitleValueTitle,
                        message: refreshViewModel.alertMessage)
                    addDayGoalMainView.getTextFieldView().dailyGoalViewModel = DailyGoalTextFieldViewModel(
                        text: "\(refreshViewModel.dailyGoal)",
                        placeholder: nil)
                case .biggerValue:
                    showAlert(
                        title: refreshViewModel.alertBigValueTitle,
                        message: refreshViewModel.alertMessage)
                    addDayGoalMainView.getTextFieldView().dailyGoalViewModel = DailyGoalTextFieldViewModel(
                        text: "\(refreshViewModel.dailyGoal)",
                        placeholder: nil)
                case .notShow:
                    dismiss(animated: true)
                }
            }
            addDayGoalViewModel.saveButtonChange = { [unowned self] buttonState in
                buttonState == .turnOn ? addDayGoalMainView.getSaveButton().turnOn() : addDayGoalMainView.getSaveButton().turnOff()
            }
            
            addDayGoalMainView.getTitleLabel().text = addDayGoalViewModel.title
            addDayGoalMainView.getDismissButton().setTitle(with: addDayGoalViewModel.dismissButtonTitle)
            addDayGoalMainView.getSaveButton().setTitle(with: addDayGoalViewModel.saveButtonTitle)
        }
    }
}

extension AddDayGoalViewController {
    
    override func loadView() {
        view = addDayGoalMainView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setSaveButtonState()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.modalControllerWillDisapear(self)
    }
    
    override func configureViews() {
        super.configureViews()
        
        addDayGoalViewModel = AddDayGoalViewModel()

        addDayGoalMainView.getTextFieldView().dailyGoalViewModel = DailyGoalTextFieldViewModel(
            text: "\(addDayGoalViewModel.dailyGoal)",
            placeholder: addDayGoalViewModel.textFieldPlaceholder
        )
    }
}

extension AddDayGoalViewController: UITextFieldDelegate {
    
    // Hide keybord on tap on the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

extension AddDayGoalViewController: AddDayGoalMainViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addDayGoalMainView.delegate = self
    }
    
    func dismissButtonDidPressed() {
        dismiss(animated: true)
    }
    
    func saveButtonDidPressed() {
        guard let newValue = Int(addDayGoalMainView.getTextFieldView().getCurrentTextFieldText()) else { return }
        addDayGoalViewModel.saveButtonPressed(newValue)
    }
}

private extension AddDayGoalViewController {
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: addDayGoalViewModel.alertOkActionTitle,
                                     style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func setSaveButtonState() {
        let text = addDayGoalMainView.getTextFieldView().getCurrentTextFieldText()
        addDayGoalViewModel.setSaveButtonStateFor(text)
    }
}
