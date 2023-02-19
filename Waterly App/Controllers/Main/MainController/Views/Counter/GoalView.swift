//
//  GoalView.swift
//  Waterly App
//
//  Created by Olegio on 28.12.2022.
//

import UIKit

final class GoalView: BaseView {
    
    let iconView = UIImageView()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProRegular(size: 13)
        label.textColor = Resources.Colors.Text.textSecondary
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProSemibold(size: 24)
        label.textColor = Resources.Colors.Text.textMain
        return label
    }()
    
    let editButton = CustomButton(with: .text)
    
//    init(with title: String, iconImage: UIImage? = nil) {
//        titleLabel.text = title
//        iconView.image = iconImage?.withRenderingMode(.alwaysTemplate)
//
//        super.init(frame: .zero)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    // TODO: - Изменить функцию установки значения в зависимости от данных из БД
    func setValueLabel(with value: String) {
        valueLabel.text = value
    }
    
//    func addEditButtonAction(_ action: Selector, target: Any?) {
//        editButton.addTarget(target, action: action, for: .touchUpInside)
//    }
}

extension GoalView {
    
    override func addViews() {
        super.addViews()
        
        addView(iconView)
        addView(titleLabel)
        addView(valueLabel)
        addView(editButton)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: topAnchor),
            iconView.leadingAnchor.constraint(equalTo: leadingAnchor),
            iconView.heightAnchor.constraint(equalToConstant: 40),
            iconView.widthAnchor.constraint(equalToConstant: 40),
            iconView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -16),
            
            titleLabel.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: valueLabel.topAnchor, constant: -6),
            
            valueLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            valueLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            valueLabel.bottomAnchor.constraint(equalTo: editButton.topAnchor, constant: -8),
            
            editButton.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 8),
            editButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            editButton.widthAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
        editButton.setTitle(with: Resources.Strings.MainController.editButton)
        
        iconView.tintColor = Resources.Colors.Accent.accentMain
    }
}
