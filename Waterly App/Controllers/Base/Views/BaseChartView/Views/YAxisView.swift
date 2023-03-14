//
//  YAxisView.swift
//  Waterly App
//
//  Created by Olegio on 10.01.2023.
//

import UIKit

final class YAxisView: BaseView {
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .equalSpacing
        view.spacing = 24
        return view
    }()
    
    func configure(data: [WeekWaterStatistic],
                   size: BaseChartView.ChartSize,
                   type: BaseChartView.ChartType) {
        
        stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        
        if size == .short {
            (0...2).reversed().forEach {
                let label = UILabel()
                label.font = Resources.Fonts.sfProMedium(size: 10)
                label.textColor = Resources.Colors.Text.textTertiary
                label.text = "\($0 * 50)%"
                
                stackView.addArrangedSubview(label)
            }
        } else if type == .year {
            (0...5).reversed().forEach {
                let label = UILabel()
                label.font = Resources.Fonts.sfProMedium(size: 10)
                label.textColor = Resources.Colors.Text.textTertiary
                label.text = "\($0 * 25000) мл"
                
                stackView.addArrangedSubview(label)
            }
        } else {
            (0...5).reversed().forEach {
                let label = UILabel()
                label.font = Resources.Fonts.sfProMedium(size: 10)
                label.textColor = Resources.Colors.Text.textTertiary
                label.text = "\($0 * 1000) мл"
                
                stackView.addArrangedSubview(label)
            }
        }
    }
}

extension YAxisView {
    
    override func addViews() {
        super.addViews()
        
        addView(stackView)
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
        
        backgroundColor = .clear
    }
}
