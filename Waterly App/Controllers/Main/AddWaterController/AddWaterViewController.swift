//
//  AddWaterViewController.swift
//  Waterly App
//
//  Created by Olegio on 16.01.2023.
//

import UIKit

final class AddWaterViewController: BaseController {
    
    var delegate: ModalViewControllerDelegate?
    
    private let dismissButton = CustomButtonView(with: .text)
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProSemibold(size: 16)
        label.textColor = Resources.Colors.Text.textMain
        label.text = Resources.Strings.MainController.AddWaterController.header
        label.textAlignment = .center
        return label
    }()
    
    private let textFieldView = WaterValueTextFieldView()
    
    private let dailyPercentView = DailyPercentView()
    
    private let currentProgressView = CurrentDailyProgressView()
    
    private let saveButton = CustomButtonView(with: .fill)
}

extension AddWaterViewController {
    
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
    
    override func addViews() {
        super.addViews()
        
        view.addView(dismissButton)
        view.addView(titleLabel)
        view.addView(textFieldView)
        view.addView(dailyPercentView)
        view.addView(currentProgressView)
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
            textFieldView.bottomAnchor.constraint(equalTo: dailyPercentView.topAnchor, constant: -32),
            
            dailyPercentView.leadingAnchor.constraint(equalTo: dismissButton.leadingAnchor),
            dailyPercentView.trailingAnchor.constraint(equalTo: currentProgressView.leadingAnchor, constant: -24),
            dailyPercentView.topAnchor.constraint(equalTo: textFieldView.bottomAnchor, constant: 32),
            dailyPercentView.widthAnchor.constraint(equalToConstant: 162),
            
            currentProgressView.leadingAnchor.constraint(equalTo: dailyPercentView.trailingAnchor, constant: 24),
            currentProgressView.topAnchor.constraint(equalTo: dailyPercentView.topAnchor),
            currentProgressView.widthAnchor.constraint(equalToConstant: 162),
            
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
        dismissButton.setTitle(with: Resources.Strings.MainController.AddWaterController.dismissButton)
        dismissButton.addTarget(self, action: #selector(dismissButtonAction), for: .touchUpInside)
        
        saveButton.setTitle(with: Resources.Strings.MainController.AddWaterController.saveButton)
        saveButton.setColor(for: Resources.Colors.Accent.accentMain, title: .white)
        
        saveButton.addTarget(self, action: #selector(saveButtonAction), for: .touchUpInside)
    }
}

private extension AddWaterViewController {
    
    // Configure Daily Percent Label
    func configureDailyPercentLabel() {
        
        let value = textFieldView.getCurrentTextFieldText()
        
        if value.isEmpty {
            dailyPercentView.configureValueLabel(0, color: Resources.Colors.Text.textTertiary)
        } else {
            guard let doubleValue = Double(value) else { return }
            let percentFromDaily = lround(doubleValue / Double(recommendDailyValue / 100))
            dailyPercentView.configureValueLabel(percentFromDaily, color: Resources.Colors.Text.textMain)
        }
    }
    
    // Configure Current Progress Labels
    func configureCurrentProgressLabels() {
        
        let value = textFieldView.getCurrentTextFieldText()
        
        let dailyPercentProgress = lround(Double(dayProgress) / Double(dayGoal / 100))
        
        if value.isEmpty {
            currentProgressView.configureValueLabels(current: "\(dailyPercentProgress)%")
        } else {
            guard let doubleValue = Double(value) else { return }
            let newDailyValue = Double(dayProgress) + doubleValue
            let newDailyPercentProgress = lround(newDailyValue / Double(dayGoal / 100))
            currentProgressView.configureValueLabels(current: "\(dailyPercentProgress)%",
                                                     new: "\(newDailyPercentProgress)%")
        }
    }
    
    // Configure Save Button State
    func configureSaveButtonState() {
        
        let value = textFieldView.getCurrentTextFieldText()
        
        if value.isEmpty {
            saveButton.turnOff()
        } else {
            saveButton.turnOn()
        }
    }
}

@objc extension AddWaterViewController {
    
    // Dismiss Button Action
    func dismissButtonAction() {
        dismiss(animated: true)
    }
    
    // Save Button Action
    func saveButtonAction() {
        
        let value = textFieldView.getCurrentTextFieldText()
        
        guard let intValue = Int(value) else { return }
        
        dayProgress += intValue
        
        // TODO: - Контроль кол-ва элементов реализовать на уровне бека
        if recentlyAddedWater.count == 6 {
            recentlyAddedWater.removeFirst()
        }
        
        recentlyAddedWater.append(RecentlyAddedWater.init(value: intValue))
        
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
