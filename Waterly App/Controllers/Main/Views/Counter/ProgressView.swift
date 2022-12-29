//
//  ProgressView.swift
//  Waterly App
//
//  Created by Olegio on 28.12.2022.
//

import UIKit

extension CounterView {
    
    final class ProgressView: UIView {
        
        func drawProgress(with percent: CGFloat) {
            
            // Определение серой окружности/подложки и активной окружности
            let circleFrame = UIScreen.main.bounds.width / 2 - (40 + 8)
            let radius = circleFrame / 2
            let center = CGPoint(x: radius, y: radius)
            let startAngle = -CGFloat.pi * 0.5
            let endAngle = CGFloat.pi * 1.5
            
            let circlePath = UIBezierPath(arcCenter: center,
                                          radius: radius,
                                          startAngle: startAngle,
                                          endAngle: endAngle,
                                          clockwise: true)
            
            let defaultCircleLayer = CAShapeLayer()
            defaultCircleLayer.path = circlePath.cgPath
            defaultCircleLayer.strokeColor = Resources.Colors.Back.backSecondary?.cgColor
            defaultCircleLayer.lineWidth = 15
            defaultCircleLayer.strokeEnd = 1
            defaultCircleLayer.fillColor = UIColor.clear.cgColor
            defaultCircleLayer.lineCap = .round
            
            let activeCircleLayer = CAShapeLayer()
            activeCircleLayer.path = circlePath.cgPath
            activeCircleLayer.strokeColor = Resources.Colors.Accent.accentMain?.cgColor
            activeCircleLayer.lineWidth = 15
            activeCircleLayer.strokeEnd = percent
            activeCircleLayer.fillColor = UIColor.clear.cgColor
            activeCircleLayer.lineCap = .round
            
            // Определение точки на конце активного прогресса
            let dotAngle = CGFloat.pi * (0.5 - (2 * percent))
            let dotPoint = CGPoint(x: cos(-dotAngle) * radius + center.x,
                                   y: sin(-dotAngle) * radius + center.y)
            
            let dotPath = UIBezierPath()
            dotPath.move(to: dotPoint)
            dotPath.addLine(to: dotPoint)
            
            let bigDotLayer = CAShapeLayer()
            bigDotLayer.path = dotPath.cgPath
            bigDotLayer.fillColor = UIColor.clear.cgColor
            bigDotLayer.strokeColor = Resources.Colors.Accent.accentMain?.cgColor
            bigDotLayer.lineCap = .round
            bigDotLayer.lineWidth = 15
            
            let dotLayer = CAShapeLayer()
            dotLayer.path = dotPath.cgPath
            dotLayer.fillColor = UIColor.clear.cgColor
            dotLayer.strokeColor = UIColor.white.cgColor
            dotLayer.lineCap = .round
            dotLayer.lineWidth = 5
            
            // Определение разметки внутри основной окружности
            let barsFrame = UIScreen.main.bounds.width / 2 - (40 + 8 + 30)
            let barsRadius = barsFrame / 2
            
            let barsPath = UIBezierPath(arcCenter: center,
                                        radius: barsRadius,
                                        startAngle: startAngle,
                                        endAngle: endAngle,
                                        clockwise: true)
            
            let barsLayer = CAShapeLayer()
            barsLayer.path = barsPath.cgPath
            barsLayer.fillColor = UIColor.clear.cgColor
            barsLayer.strokeColor = UIColor.clear.cgColor
            barsLayer.lineWidth = 3
            
            var angle: CGFloat = 0.5
            (1...20).forEach { _ in
                let barAngle = CGFloat.pi * angle
                let barPoint = CGPoint(x: cos(-barAngle) * barsRadius + center.x,
                                       y: sin(-barAngle) * barsRadius + center.y)
                
                let barPath = UIBezierPath()
                barPath.move(to: barPoint)
                barPath.addLine(to: barPoint)
                
                let barLayer = CAShapeLayer()
                barLayer.path = barPath.cgPath
                barLayer.fillColor = UIColor.clear.cgColor
                barLayer.strokeColor = angle >= 0.5 - (2 * percent) ?
                Resources.Colors.Accent.accentMain?.cgColor :
                Resources.Colors.Back.backSecondary?.cgColor
                barLayer.lineCap = .round
                barLayer.lineWidth = 3
                
                barsLayer.addSublayer(barLayer)
                
                angle -= 0.1
            }
            
            layer.addSublayer(defaultCircleLayer)
            layer.addSublayer(activeCircleLayer)
            layer.addSublayer(bigDotLayer)
            layer.addSublayer(dotLayer)
            layer.addSublayer(barsLayer)
        }
    }
}
