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
    
    private let titleLabel: UILabel = {
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
    
    private let iconView = UIImageView()
    
    init(with title: String, iconImage: UIImage? = nil) {
        titleLabel.text = title
        iconView.image = iconImage?.withRenderingMode(.alwaysTemplate)
        
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // TODO: - Изменить функцию установки значения в зависимости от данных из БД
    func setValueLabel(with value: String) {
        valueLabel.text = value
    }
    
    // TODO: - Режим физ активности берем из БД
    func setActivityColor(for type: ActivityType) {
        switch type {
        case .low:
            iconView.tintColor = Resources.Colors.Other.yellow
            valueLabel.textColor = Resources.Colors.Other.yellow
            valueLabel.text = type.rawValue
        case .medium:
            iconView.tintColor = Resources.Colors.Other.green
            valueLabel.textColor = Resources.Colors.Other.green
            valueLabel.text = type.rawValue
        case .high:
            iconView.tintColor = Resources.Colors.Other.red
            valueLabel.textColor = Resources.Colors.Other.red
            valueLabel.text = type.rawValue
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
        
        let contentLeadingAnchor: NSLayoutAnchor = iconView.image == nil ? leadingAnchor : iconView.trailingAnchor
        let contentLeadingOffset: CGFloat = iconView.image == nil ? 16 : 8
        
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            iconView.heightAnchor.constraint(equalToConstant: 32),
            iconView.widthAnchor.constraint(equalToConstant: 32),
            
            stackView.leadingAnchor.constraint(equalTo: contentLeadingAnchor, constant: contentLeadingOffset),
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
