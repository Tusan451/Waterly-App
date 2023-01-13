//
//  ReccomendDailyWaterView.swift
//  Waterly App
//
//  Created by Olegio on 13.01.2023.
//

import UIKit

final class ReccomendDailyWaterView: BaseView {
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProMedium(size: 13)
        label.textColor = Resources.Colors.Text.textSecondary
        label.text = Resources.Strings.MainController.AddDayGoalController.reccomendGoalText
        label.numberOfLines = 0
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProSemibold(size: 24)
        label.textColor = Resources.Colors.Text.textMain
        return label
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 12
        return view
    }()
    
    func setValueForLabel(_ value: Int) {
        valueLabel.text = "\(value) мл"
    }
}

extension ReccomendDailyWaterView {
    
    override func addViews() {
        super.addViews()
        
        addView(stackView)
        stackView.addArrangedSubview(textLabel)
        stackView.addArrangedSubview(valueLabel)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
    }
}
