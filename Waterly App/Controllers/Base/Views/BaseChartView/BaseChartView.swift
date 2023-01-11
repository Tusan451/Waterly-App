//
//  BaseChartView.swift
//  Waterly App
//
//  Created by Olegio on 10.01.2023.
//

import UIKit

final class BaseChartView: BaseView {
    
    private let yAxisView = YAxisView()
    private let xAxisView = XAxisView()
    
    func configure(data: [BaseChartView.Data],
                   chartSize: ChartSize,
                   chartType: ChartType) {
        
        yAxisView.configure(data: data, size: chartSize, type: chartType)
        xAxisView.configure(data: data, size: chartSize, type: chartType)
        
        layoutIfNeeded()
        addDashLines(for: chartSize)
    }
}

extension BaseChartView {
    
    override func addViews() {
        super.addViews()
        
        addView(yAxisView)
        addView(xAxisView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            yAxisView.trailingAnchor.constraint(equalTo: trailingAnchor),
            yAxisView.topAnchor.constraint(equalTo: topAnchor),
            yAxisView.bottomAnchor.constraint(equalTo: xAxisView.topAnchor, constant: -8),
            
            xAxisView.leadingAnchor.constraint(equalTo: leadingAnchor),
            xAxisView.trailingAnchor.constraint(equalTo: yAxisView.leadingAnchor, constant: -8),
            xAxisView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
    }
}

extension BaseChartView {
    
    struct Data {
        let value: Int
        let title: String
    }
    
    enum ChartSize {
        case short
        case full
    }

    enum ChartType {
        case day
        case week
        case month
        case year
    }
}

private extension BaseChartView {
    
    func addDashLines(for chartSize: ChartSize) {
        
        if chartSize == .short {
            (0...2).map { CGFloat($0) }.forEach {
                addDashLine(at: bounds.height / 3 * $0 + 6)
            }
        } else {
            (0...5).map { CGFloat($0) }.forEach {
                addDashLine(at: bounds.height / 6 * $0 + 6)
            }
        }
    }
    
    func addDashLine(at yPosition: CGFloat) {
        let startPoint = CGPoint(x: 0, y: yPosition)
        let endPoint = CGPoint(x: bounds.width - yAxisView.bounds.width - 8, y: yPosition)
        
        let dashPath = CGMutablePath()
        dashPath.addLines(between: [startPoint, endPoint])
        
        let dashLayer = CAShapeLayer()
        dashLayer.path = dashPath
        dashLayer.strokeColor = Resources.Colors.Separator.separatorAccentSecondary?.cgColor
        dashLayer.lineWidth = 1
        
        layer.addSublayer(dashLayer)
    }
}
