//
//  BaseChartView.swift
//  Waterly App
//
//  Created by Olegio on 10.01.2023.
//

import UIKit

enum ChartSize {
    case short
    case full
}

enum ChartType {
    case day
    case week
    case month
    case halfYear
    case year
}

final class BaseChartView: BaseView {
    
    func configure(data: [BaseChartView.Data],
                   chartSize: ChartSize,
                   chartType: ChartType) {
        // TODO: - Конфигурировать график в зависимости от типа
    }
}

extension BaseChartView {
    
    override func addViews() {
        super.addViews()
    }
    
    override func layoutViews() {
        super.layoutViews()
    }
    
    override func configureViews() {
        super.configureViews()
        
        backgroundColor = .clear
    }
}

extension BaseChartView {
    
    struct Data {
        let value: Int
        let heightMultiplier: Double
    }
}
