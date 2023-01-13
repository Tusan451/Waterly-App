//
//  AddDayGoalViewController.swift
//  Waterly App
//
//  Created by Olegio on 13.01.2023.
//

import UIKit

final class AddDayGoalViewController: BaseController {
    
//    var newGoalWaterValue = 0
    
    var delegate: ModalViewControllerDelegate?
    
    private let dismissButton = CustomButtonView(with: .text)
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProSemibold(size: 16)
        label.textColor = Resources.Colors.Text.textMain
        label.text = Resources.Strings.MainController.AddDayGoalController.dayGoal
        label.textAlignment = .center
        return label
    }()
    
    private let textField = DailyGoalTextFieldView()
    
    private let recomendDailyWaterView = ReccomendDailyWaterView()
    
    private let saveButton = CustomButtonView(with: .fill)
}

extension AddDayGoalViewController {
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.modalControllerWillDisapear(self)
    }
    
    override func addViews() {
        super.addViews()
        
        view.addView(dismissButton)
        view.addView(titleLabel)
        view.addView(textField)
        
        view.addView(recomendDailyWaterView)
        view.addView(saveButton)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            dismissButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dismissButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            dismissButton.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -5),
            dismissButton.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -32),
            dismissButton.widthAnchor.constraint(equalToConstant: 80),
            dismissButton.heightAnchor.constraint(equalToConstant: 25),
            
            titleLabel.topAnchor.constraint(equalTo: dismissButton.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: dismissButton.bottomAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 180),
            titleLabel.heightAnchor.constraint(equalToConstant: 25),
            
            textField.leadingAnchor.constraint(equalTo: dismissButton.leadingAnchor),
            textField.topAnchor.constraint(equalTo: dismissButton.bottomAnchor, constant: 32),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textField.bottomAnchor.constraint(equalTo: recomendDailyWaterView.topAnchor, constant: -32),
            
            recomendDailyWaterView.leadingAnchor.constraint(equalTo: dismissButton.leadingAnchor),
            recomendDailyWaterView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            recomendDailyWaterView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 32),
            
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
        dismissButton.setTitle(with: Resources.Strings.MainController.AddDayGoalController.dismissButton)
        dismissButton.addTarget(self, action: #selector(dismissButtonAction), for: .touchUpInside)
                
        textField.setTextFieldValue(text: "\(dayGoal)")
        recomendDailyWaterView.setValueForLabel(recommendDailyValue)
        
        saveButton.setTitle(with: Resources.Strings.MainController.AddDayGoalController.saveButton)
        saveButton.setColor(for: Resources.Colors.Accent.accentMain, title: .white)
        
        saveButton.addTarget(self, action: #selector(saveButtonAction), for: .touchUpInside)
    }
}

@objc extension AddDayGoalViewController {
    
    func dismissButtonAction() {
        dismiss(animated: true)
    }
    
    func saveButtonAction() {
        guard let newValue = Int(textField.getCurrentTextFieldText()) else { return }
        dayGoal = newValue
        dismiss(animated: true)
    }
}

extension AddDayGoalViewController: UITextFieldDelegate {
    
    // Hide keybord on tap on the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
