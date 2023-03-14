//
//  HeaderView.swift
//  Waterly App
//
//  Created by Olegio on 27.12.2022.
//

import UIKit

final class HeaderView: BaseView {
    
    private let motivationLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProRegular(size: 16)
        label.textColor = Resources.Colors.Text.textSecondary
        return label
    }()
    
    func configureMotivationLabel(with title: String) {
        motivationLabel.text = title
    }
}

extension HeaderView {
    
    override func addViews() {
        super.addViews()
        
        addView(motivationLabel)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            motivationLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            motivationLabel.topAnchor.constraint(equalTo: topAnchor),
            motivationLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            motivationLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
        backgroundColor = Resources.Colors.Back.backMain
    }
}
