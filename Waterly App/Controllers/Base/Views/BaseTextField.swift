//
//  BaseTextField.swift
//  Waterly App
//
//  Created by Olegio on 13.01.2023.
//

import UIKit

class BaseTextField: BaseView {
        
    private let textField: UITextField = {
        let textField = UITextField()
        textField.textColor = Resources.Colors.Text.textMain
        textField.backgroundColor = Resources.Colors.Back.backSecondary
        return textField
    }()
    
    private let textFieldView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.backgroundColor = Resources.Colors.Back.backSecondary
        return view
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProRegular(size: 16)
        label.textColor = Resources.Colors.Text.textSecondary
        label.textAlignment = .right
        return label
    }()
    
    init(width: CGFloat,
         height: CGFloat,
         placeholder: String? = nil,
         valueLabel: String? = nil,
         keyboardType: UIKeyboardType
    ) {
        
        textFieldView.frame.size.width = width
        textFieldView.frame.size.height = height
        
        textField.placeholder = placeholder
        textField.keyboardType = keyboardType
        
        self.valueLabel.text = valueLabel
        
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setText(_ text: String) {
        textField.text = text
    }
    
    func getCurrentText() -> String {
        guard let text = textField.text else { return "" }
        return text
    }
}

extension BaseTextField {
    
    override func addViews() {
        super.addViews()
        
        addView(textFieldView)
        addView(textField)
        addView(valueLabel)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            textFieldView.leadingAnchor.constraint(equalTo: leadingAnchor),
            textFieldView.topAnchor.constraint(equalTo: topAnchor),
            textFieldView.trailingAnchor.constraint(equalTo: trailingAnchor),
            textFieldView.bottomAnchor.constraint(equalTo: bottomAnchor),
            textFieldView.widthAnchor.constraint(equalToConstant: textFieldView.frame.width),
            textFieldView.heightAnchor.constraint(equalToConstant: textFieldView.frame.height),
            
            textField.leadingAnchor.constraint(equalTo: textFieldView.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: valueLabel.leadingAnchor, constant: -8),
            textField.topAnchor.constraint(equalTo: textFieldView.topAnchor, constant: 2),
            textField.bottomAnchor.constraint(equalTo: textFieldView.bottomAnchor, constant: -2),
            
            valueLabel.leadingAnchor.constraint(equalTo: textField.trailingAnchor, constant: 8),
            valueLabel.trailingAnchor.constraint(equalTo: textFieldView.trailingAnchor, constant: -16),
            valueLabel.centerYAnchor.constraint(equalTo: textFieldView.centerYAnchor),
            valueLabel.widthAnchor.constraint(equalToConstant: 30),
            valueLabel.heightAnchor.constraint(equalToConstant: 25),
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
        self.backgroundColor = .clear
        
        textField.delegate = self
    }
}

extension BaseTextField: UITextFieldDelegate {
    
    // TextField Active State
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        textField.placeholder = nil
        
        textFieldView.layer.borderWidth = 1
        textFieldView.layer.borderColor = Resources.Colors.Separator.separatorAccent?.cgColor
        return true
    }
    
    // Return Button action
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // End editing
    func textFieldDidEndEditing(_ textField: UITextField) {        
        textFieldView.layer.borderWidth = 0
        textFieldView.layer.borderColor = nil
        
        guard let text = textField.text else { return }
        if text.isEmpty {
            textField.placeholder =
            Resources.Strings.MainController.AddWaterController.placeholder
        }
    }
}
