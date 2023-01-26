//
//  FirstPageVCMainView.swift
//  Waterly App
//
//  Created by Olegio on 25.01.2023.
//

import UIKit

final class FirstPageVCMainView: BaseView {
    
    let iconView = UIImageView()
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProLight(size: 46)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    let secondaryLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProSemibold(size: 46)
        label.textColor = .white
        return label
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProRegular(size: 32)
        label.textColor = Resources.Colors.Other.green
        label.textAlignment = .right
        return label
    }()
}

extension FirstPageVCMainView {
    
    override func addViews() {
        super.addViews()
        
        addView(iconView)
        addView(mainLabel)
        addView(secondaryLabel)
        addView(authorLabel)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            iconView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconView.heightAnchor.constraint(equalToConstant: 100),
            iconView.widthAnchor.constraint(equalToConstant: 100),
            iconView.bottomAnchor.constraint(equalTo: mainLabel.topAnchor, constant: -40),
            
            mainLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            mainLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            mainLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            secondaryLabel.leadingAnchor.constraint(equalTo: mainLabel.leadingAnchor),
            secondaryLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 0),
            secondaryLabel.trailingAnchor.constraint(equalTo: mainLabel.trailingAnchor),
            secondaryLabel.bottomAnchor.constraint(equalTo: authorLabel.topAnchor, constant: -24),
            
            authorLabel.leadingAnchor.constraint(equalTo: mainLabel.leadingAnchor),
            authorLabel.topAnchor.constraint(equalTo: secondaryLabel.bottomAnchor, constant: 24),
            authorLabel.trailingAnchor.constraint(equalTo: mainLabel.trailingAnchor)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
        self.backgroundColor = Resources.Colors.Back.newUserPresentationBack
    }
}
