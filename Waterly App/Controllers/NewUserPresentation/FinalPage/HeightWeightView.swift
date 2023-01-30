//
//  HeightWeightView.swift
//  Waterly App
//
//  Created by Olegio on 27.01.2023.
//

import UIKit

final class HeightWeightView: BaseView {
    
    let heightTitleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProRegular(size: 20)
        label.text = Resources.Strings.NewUserPageVC.FinalPage.heightTitle
        label.textColor = .white
        return label
    }()
    
    let heightTextField = BaseTextField(
        width: 130,
        height: 50,
        backgroundColor: Resources.Colors.Back.textFieldBack,
        keyboardType: .numberPad
    )
    
    let weightTitleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProRegular(size: 20)
        label.text = Resources.Strings.NewUserPageVC.FinalPage.weightTitle
        label.textColor = .white
        return label
    }()
    
    let weightTextField = BaseTextField(
        width: 130,
        height: 50,
        backgroundColor: Resources.Colors.Back.textFieldBack,
        keyboardType: .numberPad
    )
}

extension HeightWeightView {
    
    override func addViews() {
        super.addViews()
        
        addView(heightTitleLabel)
        addView(heightTextField)
        addView(weightTitleLabel)
        addView(weightTextField)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            heightTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            heightTitleLabel.topAnchor.constraint(equalTo: topAnchor),
            heightTitleLabel.trailingAnchor.constraint(equalTo: weightTitleLabel.leadingAnchor, constant: -24),
            heightTitleLabel.bottomAnchor.constraint(equalTo: heightTextField.topAnchor, constant: -12),
            heightTitleLabel.widthAnchor.constraint(equalToConstant: 130),
            
            heightTextField.leadingAnchor.constraint(equalTo: heightTitleLabel.leadingAnchor),
            heightTextField.topAnchor.constraint(equalTo: heightTitleLabel.bottomAnchor, constant: 12),
            heightTextField.trailingAnchor.constraint(equalTo: weightTextField.leadingAnchor, constant: -24),
            heightTextField.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            weightTitleLabel.leadingAnchor.constraint(equalTo: heightTitleLabel.trailingAnchor, constant: 24),
            weightTitleLabel.topAnchor.constraint(equalTo: topAnchor),
            weightTitleLabel.bottomAnchor.constraint(equalTo: weightTextField.topAnchor, constant: -12),
            weightTitleLabel.widthAnchor.constraint(equalToConstant: 130),
            
            weightTextField.leadingAnchor.constraint(equalTo: heightTextField.trailingAnchor, constant: 24),
            weightTextField.topAnchor.constraint(equalTo: weightTitleLabel.bottomAnchor, constant: 12),
            weightTextField.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
