//
//  DashboardInfoView.swift
//  Waterly App
//
//  Created by Olegio on 27.12.2022.
//

import UIKit

final class DashboardInfoView: BaseView {
    
    private let dailyWaterGoal = BaseInfoView(with: Resources.Strings.MainController.dailyWaterGoal,
                                              iconImage: Resources.Images.MainController.water)
    
    private let activityMode = BaseInfoView(with: Resources.Strings.MainController.activityType,
                                            iconImage: Resources.Images.MainController.activity)
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 20
        view.distribution = .fillEqually
        return view
    }()
}

extension DashboardInfoView {
    
    override func addViews() {
        super.addViews()
        
        addView(stackView)
        stackView.addArrangedSubview(dailyWaterGoal)
        stackView.addArrangedSubview(activityMode)
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
        
        dailyWaterGoal.setValueLabel(with: "2000")
        activityMode.setActivityColor(for: .medium)
    }
}
