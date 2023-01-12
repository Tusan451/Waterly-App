//
//  WeeklySummaryView.swift
//  Waterly App
//
//  Created by Olegio on 10.01.2023.
//

import UIKit

final class WeeklySummaryView: BaseView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Resources.Strings.MainController.weeklySummary
        label.font = Resources.Fonts.sfProMedium(size: 16)
        label.textColor = Resources.Colors.Text.textMain
        return label
    }()
    
    private let chartView = BaseChartView()
    
    private let statisticsView = WeeklyStatisticsView()
    
    func configure(items: [WaterData],
                   size: BaseChartView.ChartSize,
                   type: BaseChartView.ChartType) {
        
        chartView.configure(data: items, chartSize: size, chartType: type)
        statisticsView.configureWith(items: items)
    }
}

extension WeeklySummaryView {
    
    override func addViews() {
        super.addViews()
        
        addView(titleLabel)
        addView(chartView)
        addView(statisticsView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: chartView.topAnchor, constant: -20),
            
            chartView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            chartView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            chartView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            chartView.bottomAnchor.constraint(equalTo: statisticsView.topAnchor, constant: -20),
            
            statisticsView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            statisticsView.topAnchor.constraint(equalTo: chartView.bottomAnchor, constant: 20),
            statisticsView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            statisticsView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
        backgroundColor = .clear
    }
}
