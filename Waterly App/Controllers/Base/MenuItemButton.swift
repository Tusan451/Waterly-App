//
//  MenuItemButton.swift
//  Waterly App
//
//  Created by Olegio on 30.01.2023.
//

import UIKit

final class MenuItemButton: UIButton {
    
    private let titleImageView: UIImageView = {
        let view = UIImageView()
        view.tintColor = Resources.Colors.Accent.accentMain
        return view
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProRegular(size: 16)
        label.textColor = Resources.Colors.Text.textMain
        return label
    }()
    
    private let arrowImageView: UIImageView = {
        let view = UIImageView()
        view.tintColor = Resources.Colors.Accent.accentMain
        return view
    }()
    
    init(title: String, image: UIImage?) {
        super.init(frame: .zero)
        self.titleImageView.image = image?.withRenderingMode(.alwaysTemplate)
        self.label.text = title
        
        addViews()
        layoutViews()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension MenuItemButton {
    
    func addViews() {
        
        addView(titleImageView)
        addView(label)
        addView(arrowImageView)
    }
    
    func layoutViews() {
        
        NSLayoutConstraint.activate([
            titleImageView.widthAnchor.constraint(equalToConstant: 40),
            titleImageView.heightAnchor.constraint(equalToConstant: 40),
            titleImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleImageView.topAnchor.constraint(equalTo: topAnchor),
            titleImageView.trailingAnchor.constraint(equalTo: label.leadingAnchor, constant: -6),
            titleImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            label.leadingAnchor.constraint(equalTo: titleImageView.trailingAnchor, constant: 6),
            label.centerYAnchor.constraint(equalTo: titleImageView.centerYAnchor),
            label.trailingAnchor.constraint(equalTo: arrowImageView.leadingAnchor, constant: -12),
            
            arrowImageView.widthAnchor.constraint(equalToConstant: 40),
            arrowImageView.heightAnchor.constraint(equalToConstant: 40),
            arrowImageView.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 12),
            arrowImageView.topAnchor.constraint(equalTo: topAnchor),
            arrowImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            arrowImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure() {
        
        arrowImageView.image = Resources.Images.SettingsModule.menuArrow?.withRenderingMode(.alwaysTemplate)
        
        makeSystem(self)
    }
}
