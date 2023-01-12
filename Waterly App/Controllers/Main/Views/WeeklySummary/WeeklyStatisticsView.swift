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
    }
    
    override func configureViews() {
        super.configureViews()
    }
}
