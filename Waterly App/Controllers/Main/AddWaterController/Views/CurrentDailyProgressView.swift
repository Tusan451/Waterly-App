//
//  CurrentDailyProgressView.swift
//  Waterly App
//
//  Created by Olegio on 17.01.2023.
//

import UIKit

final class CurrentDailyProgressView: BaseView {
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProMedium(size: 13)
        label.textColor = Resources.Colors.Text.textSecondary
        label.numberOfLines = 0
        return label
    }()
    
    let currentValueLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProSemibold(size: 24)
        label.textColor = Resources.Colors.Text.textMain
        return label
    }()
    
    let arrowView: UIImageView = {
        let view = UIImageView()
        view.image = Resources.Images.AddWaterViewController.arrow?.withRenderingMode(.alwaysTemplate)
        view.tintColor = Resources.Colors.Text.textMain
        return view
    }()
    
    let newValueLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProSemibold(size: 24)
        label.textColor = Resources.Colors.Accent.accentMain
        return label
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 7
        view.distribution = .equalSpacing
        return view
    }()
}

extension CurrentDailyProgressView {
    
    override func addViews() {
        super.addViews()
        
        addView(textLabel)
        addView(stackView)
        
        stackView.addArrangedSubview(currentValueLabel)
        stackView.addArrangedSubview(arrowView)
        stackView.addArrangedSubview(newValueLabel)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            textLabel.topAnchor.constraint(equalTo: topAnchor),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            textLabel.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -14),
            
            arrowView.widthAnchor.constraint(equalToConstant: 24),
            arrowView.heightAnchor.constraint(equalToConstant: 24),
            
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 14),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
