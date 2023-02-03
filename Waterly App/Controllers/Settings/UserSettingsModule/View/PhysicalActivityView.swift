//
//  PhysicalActivityView.swift
//  Waterly App
//
//  Created by Olegio on 27.01.2023.
//

import UIKit

final class PhysicalActivityView: BaseView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProRegular(size: 20)
        label.text = Resources.Strings.NewUserPageVC.FinalPage.physicalActivityTitle
        label.textColor = .white
        return label
    }()
    
    let physicalActivityLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProMedium(size: 16)
        label.text = Resources.Strings.NewUserPageVC.FinalPage.mediumPhysicalActivity
        label.textColor = Resources.Colors.Other.yellow
        return label
    }()
    
    let physicalActivitySlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 5
        slider.value = 2.5
        slider.minimumTrackTintColor = Resources.Colors.Other.yellow
        slider.maximumTrackTintColor = Resources.Colors.Back.textFieldBack
        return slider
    }()
}

extension PhysicalActivityView {
    
    override func addViews() {
        super.addViews()
        
        addView(titleLabel)
        addView(physicalActivityLabel)
        addView(physicalActivitySlider)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: physicalActivityLabel.topAnchor, constant: -12),
            
            physicalActivityLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            physicalActivityLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            physicalActivityLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            physicalActivityLabel.bottomAnchor.constraint(equalTo: physicalActivitySlider.topAnchor,
                                                          constant: -16),
            
            physicalActivitySlider.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            physicalActivitySlider.topAnchor.constraint(equalTo: physicalActivityLabel.bottomAnchor,
                                                        constant: 16),
            physicalActivitySlider.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            physicalActivitySlider.heightAnchor.constraint(equalToConstant: 26),
            physicalActivitySlider.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
