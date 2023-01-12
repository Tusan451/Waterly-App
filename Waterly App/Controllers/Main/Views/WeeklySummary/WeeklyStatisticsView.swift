//
//  WeeklyStatisticsView.swift
//  Waterly App
//
//  Created by Olegio on 12.01.2023.
//

import UIKit

final class WeeklyStatisticsView: BaseView {
    
    private let hitGoalsView = BaseInfoView(with: Resources.Strings.MainController.hitGoals)
    private let averageDrinkedView = BaseInfoView(with: Resources.Strings.MainController.averageDrinked)
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 20
        view.distribution = .fillEqually
        return view
    }()
    
    // TODO: - Конфигурация данных из БД
    func configureWith(dailyGoal: Int, and activityType: ActivityType) {
        
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
