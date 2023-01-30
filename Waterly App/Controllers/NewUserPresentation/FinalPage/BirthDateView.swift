//
//  BirthDateView.swift
//  Waterly App
//
//  Created by Olegio on 27.01.2023.
//

import UIKit

final class BirthDateView: BaseView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProRegular(size: 20)
        label.text = Resources.Strings.NewUserPageVC.FinalPage.birthDateTextFieldTitle
        label.textColor = .white
        return label
    }()
    
    let dayTextField = BaseTextField(
        width: 60,
        height: 50,
        backgroundColor: Resources.Colors.Back.textFieldBack,
        keyboardType: .numberPad
    )
    
    let monthTextField = BaseTextField(
        width: 140,
        height: 50,
        backgroundColor: Resources.Colors.Back.textFieldBack,
        keyboardType: .default
    )
    
    let yearTextField = BaseTextField(
        width: 80,
        height: 50,
        backgroundColor: Resources.Colors.Back.textFieldBack,
        keyboardType: .default
    )
}

extension BirthDateView {
    
    override func addViews() {
        super.addViews()
        
        addView(titleLabel)
        addView(dayTextField)
        addView(monthTextField)
        addView(yearTextField)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: dayTextField.topAnchor, constant: -12),
            
            dayTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            dayTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            dayTextField.trailingAnchor.constraint(equalTo: monthTextField.leadingAnchor, constant: -16),
            dayTextField.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            monthTextField.leadingAnchor.constraint(equalTo: dayTextField.trailingAnchor, constant: 16),
            monthTextField.topAnchor.constraint(equalTo: dayTextField.topAnchor),
            monthTextField.trailingAnchor.constraint(equalTo: yearTextField.leadingAnchor, constant: -16),
            monthTextField.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            yearTextField.leadingAnchor.constraint(equalTo: monthTextField.trailingAnchor, constant: 16),
            yearTextField.topAnchor.constraint(equalTo: dayTextField.topAnchor),
            yearTextField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
