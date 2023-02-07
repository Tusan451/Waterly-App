//
//  GenderView.swift
//  Waterly App
//
//  Created by Olegio on 02.02.2023.
//

import UIKit

final class GenderView: BaseView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProRegular(size: 14)
        label.textColor = Resources.Colors.Text.textSecondary
        return label
    }()
    
    let maleRadioButton = RadioButton(.selected,
                                      color: Resources.Colors.Accent.accentMain)
    
    let maleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProRegular(size: 16)
        label.textColor =  Resources.Colors.Text.textMain
        return label
    }()
    
    let femaleRadioButton = RadioButton(.normal,
                                        color: Resources.Colors.Accent.accentMain)
    
    let femaleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProRegular(size: 16)
        label.textColor = Resources.Colors.Text.textMain
        return label
    }()
}

extension GenderView {
    
    override func addViews() {
        super.addViews()
        
        addView(titleLabel)
        addView(maleRadioButton)
        addView(maleLabel)
        addView(femaleRadioButton)
        addView(femaleLabel)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: maleRadioButton.topAnchor, constant: -12),
            
            maleRadioButton.widthAnchor.constraint(equalToConstant: 24),
            maleRadioButton.heightAnchor.constraint(equalToConstant: 24),
            maleRadioButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            maleRadioButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            maleRadioButton.trailingAnchor.constraint(equalTo: maleLabel.leadingAnchor, constant: -12),
            maleRadioButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            maleLabel.heightAnchor.constraint(equalToConstant: 19),
            maleLabel.widthAnchor.constraint(equalToConstant: 90),
            maleLabel.leadingAnchor.constraint(equalTo: maleRadioButton.trailingAnchor, constant: 12),
            maleLabel.trailingAnchor.constraint(equalTo: femaleRadioButton.leadingAnchor, constant: -32),
            maleLabel.centerYAnchor.constraint(equalTo: maleRadioButton.centerYAnchor),
            
            femaleRadioButton.widthAnchor.constraint(equalToConstant: 24),
            femaleRadioButton.heightAnchor.constraint(equalToConstant: 24),
            femaleRadioButton.leadingAnchor.constraint(equalTo: maleLabel.trailingAnchor, constant: 32),
            femaleRadioButton.topAnchor.constraint(equalTo: maleRadioButton.topAnchor),
            femaleRadioButton.trailingAnchor.constraint(equalTo: femaleLabel.leadingAnchor, constant: -12),
            femaleRadioButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            femaleLabel.heightAnchor.constraint(equalToConstant: 19),
            femaleLabel.widthAnchor.constraint(equalToConstant: 90),
            femaleLabel.leadingAnchor.constraint(equalTo: femaleRadioButton.trailingAnchor, constant: 12),
            femaleLabel.centerYAnchor.constraint(equalTo: femaleRadioButton.centerYAnchor)
        ])
    }
}
