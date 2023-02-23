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
    
    private let barsView = UIView()
    
    func configure(data: [WeekWaterStatistic],
                   chartSize: ChartSize,
                   chartType: ChartType) {
        
        yAxisView.configure(data: data, size: chartSize, type: chartType)
        xAxisView.configure(data: data, size: chartSize, type: chartType)
        
        layoutIfNeeded()
        addDashLines(for: chartSize)
        addBarsFrom(data: data)
    }
}

extension BaseChartView {
    
    override func addViews() {
        super.addViews()
        
        addView(yAxisView)
        addView(xAxisView)
        addView(barsView)
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
            
            barsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            barsView.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            barsView.trailingAnchor.constraint(equalTo: yAxisView.leadingAnchor, constant: -8),
            barsView.bottomAnchor.constraint(equalTo: xAxisView.topAnchor, constant: -16)
        ])
    }
}

extension BaseChartView {
    
//    struct Data {
//        let value: Int
//        let title: String
//    }
    
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
    
    func addBarsFrom(data: [WeekWaterStatistic]) {
        
        var xPosition: CGFloat = 20
        
        data.forEach {
            addBarWith(value: $0.capacity, at: xPosition)
            xPosition += 46
        }
    }
    
    func addBarWith(value: Int, at xPosition: CGFloat) {
        
        var barColor = UIColor()
        
        let dayWaterGoal = UserDataManager.shared.getWaterGoal(for: Resources.Keys.waterGoalKey) ?? 0
        
        if value == 0 {
            barColor = .clear
        } else if value == dayWaterGoal {
            barColor = Resources.Colors.Accent.accentMain ?? .clear
        } else {
            barColor = Resources.Colors.Accent.accentInactive ?? .clear
        }
        
        let heightMultiplier: CGFloat = CGFloat(value) / CGFloat(dayWaterGoal)
        
        let startPoint = CGPoint(x: xPosition, y: barsView.bounds.height + 4)
        let endPoint = CGPoint(x: xPosition, y: barsView.bounds.height - (barsView.bounds.height * heightMultiplier) + 8)
        
        let barPath = CGMutablePath()
        barPath.addLines(between: [startPoint, endPoint])
        
        let barLayer = CAShapeLayer()
        barLayer.path = barPath
        barLayer.strokeColor = barColor.cgColor
        barLayer.lineWidth = 4
        barLayer.lineCap = .round
        
        let barLayerAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        barLayerAnimation.fromValue = 0
        barLayerAnimation.toValue = barLayer.strokeEnd
        barLayerAnimation.duration = 0.7
        barLayerAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        barLayerAnimation.fillMode = CAMediaTimingFillMode.forwards
        barLayerAnimation.isRemovedOnCompletion = false
        
        barLayer.add(barLayerAnimation, forKey: "activeCircleAnimation")
        
        layer.addSublayer(barLayer)
    }
}
