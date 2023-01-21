//
//  AddDayGoalControllerMainView.swift
//  Waterly App
//
//  Created by Olegio on 20.01.2023.
//

import UIKit

protocol AddDayGoalMainViewDelegate: AnyObject {
    
    func dismissButtonDidPressed()
    func saveButtonDidPressed()
}

class AddDayGoalMainView: BaseView {
    
    weak var delegate: AddDayGoalMainViewDelegate?
    
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

extension AddDayGoalMainView {
    
    override func addViews() {
        super.addViews()
        
        addView(dismissButton)
        addView(titleLabel)
        addView(textFieldView)
        
        addView(recomendDailyWaterView)
        addView(saveButton)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            dismissButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            dismissButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            dismissButton.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -5),
            dismissButton.bottomAnchor.constraint(equalTo: textFieldView.topAnchor, constant: -32),
            dismissButton.widthAnchor.constraint(equalToConstant: 80),
            dismissButton.heightAnchor.constraint(equalToConstant: 25),
            
            titleLabel.topAnchor.constraint(equalTo: dismissButton.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: dismissButton.bottomAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 180),
            titleLabel.heightAnchor.constraint(equalToConstant: 25),
            
            textFieldView.leadingAnchor.constraint(equalTo: dismissButton.leadingAnchor),
            textFieldView.topAnchor.constraint(equalTo: dismissButton.bottomAnchor, constant: 32),
            textFieldView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            textFieldView.bottomAnchor.constraint(equalTo: recomendDailyWaterView.topAnchor, constant: -32),
            
            recomendDailyWaterView.leadingAnchor.constraint(equalTo: dismissButton.leadingAnchor),
            recomendDailyWaterView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            recomendDailyWaterView.topAnchor.constraint(equalTo: textFieldView.bottomAnchor, constant: 32),
            
            saveButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            saveButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40)
        ])
    }
    
    override func configureViews() {
        super.configureViews()

        dismissButton.addTarget(self, action: #selector(dismissButtonAction), for: .touchUpInside)
                        
        saveButton.setColor(for: Resources.Colors.Accent.accentMain, title: .white)
        saveButton.addTarget(self, action: #selector(saveButtonAction), for: .touchUpInside)
    }
}

// Get Access to private values
extension AddDayGoalMainView {
    
    func getTitleLabel() -> UILabel {
        return titleLabel
    }
    
    func getDismissButton() -> CustomButton {
        return dismissButton
    }
    
    func getSaveButton() -> CustomButton {
        return saveButton
    }
    
    func getTextFieldView() -> DailyGoalTextFieldView {
        return textFieldView
    }
}

@objc extension AddDayGoalMainView {
    
    func dismissButtonAction() {
        delegate?.dismissButtonDidPressed()
    }
    
    func saveButtonAction() {
        delegate?.saveButtonDidPressed()
    }
}
