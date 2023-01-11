//
//  XAxisView.swift
//  Waterly App
//
//  Created by Olegio on 10.01.2023.
//

import UIKit

final class XAxisView: BaseView {
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillEqually
        return view
    }()
    
    func configure(data: [BaseChartView.Data],
                   size: BaseChartView.ChartSize,
                   type: BaseChartView.ChartType) {
        
        stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        
        data.forEach {
            let label = UILabel()
            label.font = Resources.Fonts.sfProMedium(size: 10)
            label.textColor = Resources.Colors.Text.textTertiary
            label.textAlignment = .center
            label.text = $0.title
            
            stackView.addArrangedSubview(label)
        }
    }
}

extension XAxisView {
    
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
