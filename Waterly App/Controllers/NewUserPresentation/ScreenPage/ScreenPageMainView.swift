//
//  ScreenPageMainView.swift
//  Waterly App
//
//  Created by Olegio on 26.01.2023.
//

import UIKit

final class ScreenPageMainView: BaseView {
        
    let imageView = UIImageView()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProMedium(size: 28)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProMedium(size: 16)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
}

extension ScreenPageMainView {
    
    override func addViews() {
        super.addViews()
        
        addView(titleLabel)
        addView(imageView)
        addView(messageLabel)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            titleLabel.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -20),
            
            imageView.widthAnchor.constraint(equalToConstant: 337),
            imageView.heightAnchor.constraint(equalToConstant: 535),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            imageView.bottomAnchor.constraint(equalTo: messageLabel.topAnchor),
            
            messageLabel.widthAnchor.constraint(equalToConstant: 250),
            messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            messageLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor)
        ])
    }
}
