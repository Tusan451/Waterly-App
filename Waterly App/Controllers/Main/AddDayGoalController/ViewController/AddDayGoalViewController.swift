//
//  AddDayGoalViewController.swift
//  Waterly App
//
//  Created by Olegio on 13.01.2023.
//

import UIKit

final class AddDayGoalViewController: BaseController {
        
    weak var delegate: ModalViewControllerDelegate?
    
    var addDayGoalViewModel: AddDayGoalViewModelProtocol! {
        didSet {
            addDayGoalViewModel.viewDidChange = { [unowned self] refreshViewModel in
                switch refreshViewModel.alert {
                case .littleValue:
                    showAlert(
                        title: refreshViewModel.alertLitleValueTitle,
                        message: refreshViewModel.alertMessage)
                    textFieldView.dailyGoalViewModel = DailyGoalTextFieldViewModel(
                        text: "\(refreshViewModel.dailyGoal)",
                        placeholder: nil)
                case .biggerValue:
                    showAlert(
                        title: refreshViewModel.alertBigValueTitle,
                        message: refreshViewModel.alertMessage)
                    textFieldView.dailyGoalViewModel = DailyGoalTextFieldViewModel(
                        text: "\(refreshViewModel.dailyGoal)",
                        placeholder: nil)
                case .notShow:
                    dismiss(animated: true)
                }
            }
            addDayGoalViewModel.saveButtonChange = { [unowned self] buttonState in
                buttonState == .turnOn ? saveButton.turnOn() : saveButton.turnOff()
            }
            
            titleLabel.text = addDayGoalViewModel.title
            dismissButton.setTitle(with: addDayGoalViewModel.dismissButtonTitle)
            saveButton.setTitle(with: addDayGoalViewModel.saveButtonTitle)
        }
    }
    
    private let dismissButton = CustomButton(with: .text)
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProSemibold(size: 16)
        label.textColor = Resources.Colors.Text.textMain
        label.textAlignment = .center
        return label
    }()
    
    private let textFieldView = DailyGoalTextFieldView()
    
    private let recomendDailyWaterView = ReccomendDailyWaterView()
    
    private let saveButton = CustomButton(with: .fill)
}

extension AddDayGoalViewController {
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setSaveButtonState()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.modalControllerWillDisapear(self)
    }
    
    override func addViews() {
        super.addViews()
        
        view.addView(dismissButton)
        view.addView(titleLabel)
        view.addView(textFieldView)
        
        view.addView(recomendDailyWaterView)
        view.addView(saveButton)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            dismissButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dismissButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            dismissButton.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -5),
            dismissButton.bottomAnchor.constraint(equalTo: textFieldView.topAnchor, constant: -32),
            dismissButton.widthAnchor.constraint(equalToConstant: 80),
            dismissButton.heightAnchor.constraint(equalToConstant: 25),
            
            titleLabel.topAnchor.constraint(equalTo: dismissButton.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: dismissButton.bottomAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 180),
            titleLabel.heightAnchor.constraint(equalToConstant: 25),
            
            textFieldView.leadingAnchor.constraint(equalTo: dismissButton.leadingAnchor),
            textFieldView.topAnchor.constraint(equalTo: dismissButton.bottomAnchor, constant: 32),
            textFieldView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textFieldView.bottomAnchor.constraint(equalTo: recomendDailyWaterView.topAnchor, constant: -32),
            
            recomendDailyWaterView.leadingAnchor.constraint(equalTo: dismissButton.leadingAnchor),
            recomendDailyWaterView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            recomendDailyWaterView.topAnchor.constraint(equalTo: textFieldView.bottomAnchor, constant: 32),
            
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
        addDayGoalViewModel = AddDayGoalViewModel()
        
        textFieldView.dailyGoalViewModel = DailyGoalTextFieldViewModel(
            text: "\(addDayGoalViewModel.dailyGoal)",
            placeholder: addDayGoalViewModel.textFieldPlaceholder
        )

        dismissButton.addTarget(self, action: #selector(dismissButtonAction), for: .touchUpInside)
                        
        saveButton.setColor(for: Resources.Colors.Accent.accentMain, title: .white)
        saveButton.addTarget(self, action: #selector(saveButtonAction), for: .touchUpInside)
    }
}

@objc extension AddDayGoalViewController {
    
    func dismissButtonAction() {
        dismiss(animated: true)
    }
    
    func saveButtonAction() {
        guard let newValue = Int(textFieldView.getCurrentTextFieldText()) else { return }
        addDayGoalViewModel.saveButtonPressed(newValue)
    }
}

extension AddDayGoalViewController: UITextFieldDelegate {
    
    // Hide keybord on tap on the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
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
        let text = textFieldView.getCurrentTextFieldText()
        addDayGoalViewModel.setSaveButtonStateFor(text)
    }
}
