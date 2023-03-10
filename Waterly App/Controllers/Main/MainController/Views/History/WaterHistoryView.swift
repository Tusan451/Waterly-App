//
//  WaterHistoryView.swift
//  Waterly App
//
//  Created by Olegio on 30.12.2022.
//

import UIKit

final class WaterHistoryView: BaseView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProMedium(size: 16)
        label.textColor = Resources.Colors.Text.textMain
        return label
    }()
        
    private let addedWaterStackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 10
        view.distribution = .fillEqually
        return view
    }()
    
    func configure(items: [WaterCapacity]) {
        
        addedWaterStackView.removeAllArrangedSubviews()
        
        items.forEach {
            let addedWaterItem = AddedWaterView(value: $0.capacity)
            addedWaterStackView.addArrangedSubview(addedWaterItem)
        }
        
        if items.count < 6 {
            for _ in 1...(6 - items.count) {
                let emptyWaterItem = AddedWaterView(value: 0)
                addedWaterStackView.addArrangedSubview(emptyWaterItem)
            }
        }
    }
}

extension WaterHistoryView {
    
    override func addViews() {
        super.addViews()
        
        addView(titleLabel)
        
        addView(addedWaterStackView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: addedWaterStackView.topAnchor, constant: -20),
            
            addedWaterStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            addedWaterStackView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            addedWaterStackView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            addedWaterStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
    }
}
