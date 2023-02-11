//
//  DashboardInfoView.swift
//  Waterly App
//
//  Created by Olegio on 27.12.2022.
//

import UIKit

final class DashboardInfoView: BaseView {
    
//    let dailyWaterGoalView = BaseInfoView(with: Resources.Strings.MainController.dailyWaterGoal,
//                                              iconImage: Resources.Images.MainController.water)
    
    var dailyWaterGoalView = BaseInfoView()
    
//    let activityModeView = BaseInfoView(with: Resources.Strings.MainController.activityType,
//                                            iconImage: Resources.Images.MainController.activity)
    
    var activityModeView = BaseInfoView()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 20
        view.distribution = .fillEqually
        return view
    }()
    
    // TODO: - Конфигурация данных из БД
    func configureDailyValue(recommendDailyValue: String) {
        dailyWaterGoalView.setValueLabel(with: recommendDailyValue)
    }
    
    func configureactivityType(activityType: ActivityType) {
        activityModeView.setActivityColor(for: activityType)
    }
}

extension DashboardInfoView {
    
    override func addViews() {
        super.addViews()
        
        addView(stackView)
        stackView.addArrangedSubview(dailyWaterGoalView)
        stackView.addArrangedSubview(activityModeView)
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
