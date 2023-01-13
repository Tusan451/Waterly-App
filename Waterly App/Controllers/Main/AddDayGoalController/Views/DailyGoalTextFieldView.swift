//
//  DailyGoalTextFieldView.swift
//  Waterly App
//
//  Created by Olegio on 13.01.2023.
//

import UIKit

final class DailyGoalTextFieldView: BaseView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProRegular(size: 14)
        label.textColor = Resources.Colors.Text.textSecondary
        label.text = Resources.Strings.MainController.AddDayGoalController.currentGoal
        return label
    }()
    
    private let textField = BaseTextField(
        width: UIScreen.main.bounds.width - 40,
        height: 50,
        valueLabel: Resources.Strings.MainController.AddDayGoalController.mililiters,
        keyboardType: .numberPad
    )
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 12
        return view
    }()
    
    func setTextFieldValue(text: String) {
        textField.setText(text)
    }
    
    func getCurrentTextFieldText() -> String {
        textField.getCurrentText()
    }
}

extension DailyGoalTextFieldView {
    
    override func addViews() {
        super.addViews()
        
        addView(stackView)
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(textField)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
    }
}
