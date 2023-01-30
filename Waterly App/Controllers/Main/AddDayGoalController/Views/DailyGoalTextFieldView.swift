//
//  DailyGoalTextFieldView.swift
//  Waterly App
//
//  Created by Olegio on 13.01.2023.
//

import UIKit

final class DailyGoalTextFieldView: BaseView {
    
    var dailyGoalViewModel: DailyGoalTextFieldViewModelProtocol! {
        didSet {
            titleLabel.text = dailyGoalViewModel.title
            textField.viewModel = BaseTextFieldViewModel(
                text: dailyGoalViewModel.text,
                placeholder: dailyGoalViewModel.placeholder,
                valueText: dailyGoalViewModel.secondaryText
            )
        }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProRegular(size: 14)
        label.textColor = Resources.Colors.Text.textSecondary
        return label
    }()
    
    private let textField = BaseTextField(
        width: UIScreen.main.bounds.width - 40,
        height: 50,
        backgroundColor: Resources.Colors.Back.backSecondary,
        keyboardType: .numberPad
    )
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 12
        return view
    }()
    
    func getCurrentTextFieldText() -> String {
        dailyGoalViewModel.getCurrentText(textField.viewModel.text)
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
}
