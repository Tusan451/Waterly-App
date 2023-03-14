//
//  WeeklyStatisticsView.swift
//  Waterly App
//
//  Created by Olegio on 12.01.2023.
//

import UIKit

final class WeeklyStatisticsView: BaseView {
    
    let hitGoalsView = BaseInfoView()
    
    let averageDrinkedView = BaseInfoView()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 20
        view.distribution = .fillEqually
        return view
    }()
    
    // TODO: - Конфигурация данных из БД
    func configureWith(items: [WeekWaterStatistic]) {
        
        var hitGoalsCount = 0
        let count = items.isEmpty ? 1 : items.count
        
        
        let dayWaterGoal = UserDataManager.shared.getWaterGoal(for: Resources.Keys.waterGoalKey) ?? 0
        
        items.forEach {
            if $0.capacity >= dayWaterGoal { hitGoalsCount += 1 }
        }
        
        hitGoalsView.setValueLabel(with: "\(hitGoalsCount)")
        
        let sumOfWaterValues = items.map { $0.capacity }.reduce(0) { $0 + $1 }
        let averageWaterValue = sumOfWaterValues / count
        
        averageDrinkedView.setValueLabel(with: "\(averageWaterValue) мл")
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
}
