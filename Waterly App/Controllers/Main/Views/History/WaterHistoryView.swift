//
//  WaterHistoryView.swift
//  Waterly App
//
//  Created by Olegio on 30.12.2022.
//

import UIKit

extension WaterHistoryView {
    struct Data {
        let value: Int
    }
}

final class WaterHistoryView: BaseView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Resources.Strings.MainController.recentlyAdded
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
    
    func configure(items: [WaterHistoryView.Data]) {
        items.forEach {
            let addedWaterItem = AddedWaterView(value: $0.value)
            addedWaterStackView.addArrangedSubview(addedWaterItem)
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
