//
//  CounterView.swift
//  Waterly App
//
//  Created by Olegio on 28.12.2022.
//

import UIKit

final class CounterView: BaseView {
    
    private let progressView: ProgressView = {
        let view = ProgressView()
        view.drawProgress(with: 0.3)
        return view
    }()
    
    private let goalView = GoalView(with: Resources.Strings.MainController.daylyGoal,
                                    iconImage: Resources.Images.MainController.water)
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 40
        view.distribution = .fillEqually
        return view
    }()
    
    private let addWaterButton = CustomButtonView(with: .fill)
    
    func addWaterButtonAction(_ action: Selector, target: Any?) {
        addWaterButton.addTarget(target, action: action, for: .touchUpInside)
    }
}

extension CounterView {
    
    override func addViews() {
        super.addViews()
        
        addView(addWaterButton)
        addView(stackView)
        stackView.addArrangedSubview(progressView)
        stackView.addArrangedSubview(goalView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            progressView.trailingAnchor.constraint(equalTo: goalView.leadingAnchor, constant: -40),
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: addWaterButton.topAnchor, constant: -32),
            
            addWaterButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 32),
            addWaterButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            addWaterButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            addWaterButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
                
        goalView.setValueLabel(with: "2000 мл")
        goalView.addEditButtonAction(#selector(editButtonTapped), target: self)
        
        addWaterButton.setTitle(with: Resources.Strings.MainController.addWaterButton)
        addWaterButton.setColor(for: Resources.Colors.Accent.accentMain, title: .white)
    }
}

@objc extension CounterView {
    
    func editButtonTapped() {
        print("edit button tapped")
    }
}
