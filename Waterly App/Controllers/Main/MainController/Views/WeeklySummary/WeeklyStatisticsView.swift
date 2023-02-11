//
//  WeeklyStatisticsView.swift
//  Waterly App
//
//  Created by Olegio on 12.01.2023.
//

import UIKit

final class WeeklyStatisticsView: BaseView {
    
//    private let hitGoalsView = BaseInfoView(with: Resources.Strings.MainController.hitGoals)
//    private let averageDrinkedView = BaseInfoView(with: Resources.Strings.MainController.averageDrinked)
    
    private let hitGoalsView: BaseInfoView = {
        let view = BaseInfoView()
        view.titleLabel.text = Resources.Strings.MainController.hitGoals
        return view
    }()

    private let averageDrinkedView: BaseInfoView = {
        let view = BaseInfoView()
        view.titleLabel.text = Resources.Strings.MainController.averageDrinked
        return view
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 20
        view.distribution = .fillEqually
        return view
    }()
    
    // TODO: - Конфигурация данных из БД
    func configureWith(items: [WaterData]) {
        
        var hitGoalsCount = 0
        
        items.forEach {
            if $0.value >= dayGoal { hitGoalsCount += 1 }
        }
        
        hitGoalsView.setValueLabel(with: "\(hitGoalsCount)")
        
        let sumOfWaterValues = items.map { $0.value }.reduce(0) { $0 + $1 }
        let averageWaterValue = sumOfWaterValues / items.count
        
        averageDrinkedView.setValueLabel(with: "\(averageWaterValue) мл / день")
    }
}

extension WeeklyStatisticsView {
    
    override func addViews() {
        super.addViews()
        
        addView(stackView)
        stackView.addArrangedSubview(hitGoalsView)
        stackView.addArrangedSubview(averageDrinkedView)
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
