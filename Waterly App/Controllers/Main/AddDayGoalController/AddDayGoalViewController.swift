//
//  AddDayGoalViewController.swift
//  Waterly App
//
//  Created by Olegio on 13.01.2023.
//

import UIKit

class AddDayGoalViewController: BaseController {
    
    private let dismissButton = CustomButtonView(with: .text)
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProSemibold(size: 16)
        label.textColor = Resources.Colors.Text.textMain
        label.text = Resources.Strings.MainController.AddDayGoalController.dayGoal
        label.textAlignment = .center
        return label
    }()
}

extension AddDayGoalViewController {
    
    override func addViews() {
        super.addViews()
        
        view.addView(dismissButton)
        view.addView(titleLabel)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            dismissButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dismissButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            dismissButton.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -5),
            dismissButton.widthAnchor.constraint(equalToConstant: 80),
            dismissButton.heightAnchor.constraint(equalToConstant: 25),
            
            titleLabel.topAnchor.constraint(equalTo: dismissButton.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 180),
            titleLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
        dismissButton.setTitle(with: Resources.Strings.MainController.AddDayGoalController.dismissButton)
        dismissButton.addTarget(self, action: #selector(dismissButtonAction), for: .touchUpInside)
    }
}

@objc extension AddDayGoalViewController {
    
    func dismissButtonAction() {
        dismiss(animated: true)
    }
}
