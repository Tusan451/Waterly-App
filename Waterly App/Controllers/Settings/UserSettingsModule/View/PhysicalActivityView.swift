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
        label.font = Resources.Fonts.sfProRegular(size: 14)
        label.textColor = Resources.Colors.Text.textSecondary
        return label
    }()
    
    let physicalActivityLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProMedium(size: 16)
        label.textColor = Resources.Colors.Other.yellow
        return label
    }()
    
    var physicalActivitySlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = Resources.Values.activitySliderMinimumValue
        slider.maximumValue = Resources.Values.activitySliderMaximumValue
//        slider.value = Resources.Values.activitySliderDefaultValue
        slider.minimumTrackTintColor = Resources.Colors.Other.yellow
        slider.maximumTrackTintColor = Resources.Colors.Back.backSecondary
        return slider
    }()
}

extension PhysicalActivityView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setSliderValue()
    }
    
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

private extension PhysicalActivityView {
    func setSliderValue() {
        switch physicalActivityLabel.text {
        case Resources.Strings.SettingsModule.UserSettingsModule.lowPhysicalActivity:
            physicalActivitySlider.value = Resources.Values.activitySliderLowValue
        case Resources.Strings.SettingsModule.UserSettingsModule.mediumPhysicalActivity:
            physicalActivitySlider.value = Resources.Values.activitySliderDefaultValue
        case Resources.Strings.SettingsModule.UserSettingsModule.highPhysicalActivity:
            physicalActivitySlider.value = Resources.Values.activitySliderHighValue
        default:
            break
        }
    }
}
