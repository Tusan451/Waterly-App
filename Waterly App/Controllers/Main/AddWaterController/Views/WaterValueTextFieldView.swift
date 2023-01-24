//
//  WaterValueTextFieldView.swift
//  Waterly App
//
//  Created by Olegio on 16.01.2023.
//

import UIKit

final class WaterValueTextFieldView: BaseView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProRegular(size: 14)
        label.textColor = Resources.Colors.Text.textSecondary
        return label
    }()
    
    let textField = BaseTextField(
        width: UIScreen.main.bounds.width - 40,
        height: 50,
        keyboardType: .numberPad
    )
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 12
        return view
    }()
    
    func getCurrentTextFieldText() -> String {
        textField.viewModel.text ?? ""
    }
}

extension WaterValueTextFieldView {
    
    override func addViews() {
        super.addViews()
        
        addView(stackView)
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(textField)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
    }
}
