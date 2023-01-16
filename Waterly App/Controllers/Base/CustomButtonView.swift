//
//  CustomButtonView.swift
//  Waterly App
//
//  Created by Olegio on 28.12.2022.
//

import UIKit

enum CustomButtonType {
    case fill
    case text
}

final class CustomButtonView: UIButton {
    
    private var type: CustomButtonType = .fill
    private let label = UILabel()
    
    init(with type: CustomButtonType) {
        super.init(frame: .zero)
        self.type = type
        
        addViews()
        layoutViews()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(with title: String) {
        label.text = title
    }
    
    func setColor(for button: UIColor?, title: UIColor?) {
        backgroundColor = button
        label.textColor = title
    }
    
    func turnOff() {
        self.alpha = 0.5
        self.isUserInteractionEnabled = false
    }
    
    func turnOn() {
        self.alpha = 1
        self.isUserInteractionEnabled = true
    }
}

private extension CustomButtonView {
    
    func addViews() {
        
        addView(label)
    }
    
    func layoutViews() {
        
        var verticalOffset: CGFloat {
            switch type {
            case .fill:
                return 15
            case .text:
                return 4
            }
        }
        
        NSLayoutConstraint.activate([
            
            type == .fill ? label.centerXAnchor.constraint(equalTo: centerXAnchor) :
                label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.topAnchor.constraint(equalTo: topAnchor, constant: verticalOffset),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -verticalOffset)
        ])
    }
    
    func configure() {
        
        switch type {
        case .fill:
            label.font = Resources.Fonts.sfProSemibold(size: 18)
            layer.cornerRadius = 8
        case .text:
            label.font = Resources.Fonts.sfProMedium(size: 15)
            label.textColor = Resources.Colors.Separator.separatorAccent
        }
        
        makeSystem(self)
        
        label.textAlignment = .center
    }
}


