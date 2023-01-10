//
//  AddedWaterView.swift
//  Waterly App
//
//  Created by Olegio on 30.12.2022.
//

import UIKit

final class AddedWaterView: BaseView {
    
    private let iconView: UIImageView = {
        let view = UIImageView()
        view.image = Resources.Images.MainController.glassOfWater?.withRenderingMode(.alwaysTemplate)
        return view
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProMedium(size: 13)
        label.textAlignment = .center
        return label
    }()
    
    init(value: String) {
        valueLabel.text = value + " мл"
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AddedWaterView {
    
    override func addViews() {
        super.addViews()
        
        addView(iconView)
        addView(valueLabel)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: topAnchor),
            iconView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconView.heightAnchor.constraint(equalToConstant: 50),
            iconView.widthAnchor.constraint(equalToConstant: 50),
            
            valueLabel.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 2),
            valueLabel.leadingAnchor.constraint(equalTo: iconView.leadingAnchor),
            valueLabel.trailingAnchor.constraint(equalTo: iconView.trailingAnchor),
            valueLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
        setColor()
    }
}

private extension AddedWaterView {
    
    func setColor() {
        if valueLabel.text?.first == "0" {
            valueLabel.textColor = Resources.Colors.Text.textSecondary
            iconView.tintColor = Resources.Colors.Text.textTertiary
        } else {
            valueLabel.textColor = Resources.Colors.Text.textMain
            iconView.tintColor = Resources.Colors.Accent.accentMain
        }
    }
}
