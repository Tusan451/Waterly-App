//
//  RadioButton.swift
//  Waterly App
//
//  Created by Olegio on 27.01.2023.
//

import UIKit

enum RadioButtonState {
    case normal
    case selected
}

final class RadioButton: UIButton {
    
    private var buttonState: RadioButtonState = .normal
    private let iconView = UIImageView()
    
    init(_ state: RadioButtonState, color: UIColor?) {
        self.buttonState = state
        self.iconView.tintColor = color
        super.init(frame: .zero)
        
        addViews()
        layoutViews()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension RadioButton {
    
    func addViews() {
        addView(iconView)
    }
    
    func layoutViews() {
        
        NSLayoutConstraint.activate([
            iconView.leadingAnchor.constraint(equalTo: leadingAnchor),
            iconView.topAnchor.constraint(equalTo: topAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor),
            iconView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure() {
        
        switch buttonState {
        case .normal:
            iconView.image = Resources.Images.RadioButton.normal?.withRenderingMode(.alwaysTemplate)
        case .selected:
            iconView.image = Resources.Images.RadioButton.selected?.withRenderingMode(.alwaysTemplate)
        }
        
        makeSystem(self)
    }
}
