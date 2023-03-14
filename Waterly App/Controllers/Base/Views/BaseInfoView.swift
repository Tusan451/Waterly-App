//
//  BaseInfoView.swift
//  Waterly App
//
//  Created by Olegio on 27.12.2022.
//

import UIKit

enum ActivityType: String {
    case low = "Низкая"
    case medium = "Средняя"
    case high = "Высокая"
}

class BaseInfoView: BaseView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProRegular(size: 13)
        label.textColor = Resources.Colors.Text.textSecondary
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProSemibold(size: 17)
        label.textColor = Resources.Colors.Text.textMain
        return label
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 4
        return view
    }()
    
    let iconView = UIImageView()
    
    func setValueLabel(with value: String) {
        valueLabel.text = value
    }
    
    func setActivityColor(for type: ActivityType) {
        switch type {
        case .low:
            iconView.tintColor = Resources.Colors.Other.green
            valueLabel.textColor = Resources.Colors.Other.green
            valueLabel.text = type.rawValue
        case .medium:
            iconView.tintColor = Resources.Colors.Other.yellow
            valueLabel.textColor = Resources.Colors.Other.yellow
            valueLabel.text = type.rawValue
        case .high:
            iconView.tintColor = Resources.Colors.Other.red
            valueLabel.textColor = Resources.Colors.Other.red
            valueLabel.text = type.rawValue
        }
    }
    
    func setIconColor(for type: ActivityType) {
        switch type {
        case .low:
            iconView.tintColor = Resources.Colors.Other.green
        case .medium:
            iconView.tintColor = Resources.Colors.Other.yellow
        case .high:
            iconView.tintColor = Resources.Colors.Other.red
        }
    }
}

extension BaseInfoView {
    
    override func addViews() {
        super.addViews()
        
        addView(iconView)
        addView(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(valueLabel)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            iconView.heightAnchor.constraint(equalToConstant: 32),
            iconView.widthAnchor.constraint(equalToConstant: 32),
            
            stackView.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
        self.backgroundColor = Resources.Colors.Back.backSecondary
        self.layer.cornerRadius = 8
        
        iconView.tintColor = Resources.Colors.Accent.accentMain
    }
}
