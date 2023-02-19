//
//  BaseTextField.swift
//  Waterly App
//
//  Created by Olegio on 13.01.2023.
//

import UIKit

class BaseTextField: BaseView {
    
    var viewModel: BaseTextFieldViewModelProtocol! {
        didSet {
            viewModel.textDidChange = { [unowned self] viewModel in
                textField.text = viewModel.text
                textField.placeholder = viewModel.placeholder
            }
            textField.text = viewModel.text
            textField.placeholder = viewModel.placeholder
            valueLabel.text = viewModel.valueText
        }
    }
        
    private let textField: UITextField = {
        let textField = UITextField()
        textField.textColor = Resources.Colors.Text.textMain
        return textField
    }()
    
    private let textFieldView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProRegular(size: 16)
        label.textColor = Resources.Colors.Text.textSecondary
        label.textAlignment = .right
        return label
    }()
    
    init(width: CGFloat, height: CGFloat, backgroundColor: UIColor?, keyboardType: UIKeyboardType) {
        
        textFieldView.frame.size.width = width
        textFieldView.frame.size.height = height
        textFieldView.backgroundColor = backgroundColor
        textField.backgroundColor = backgroundColor
        
        textField.keyboardType = keyboardType
        
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        addDoneButtonOnKeyboard()
    }
    
    // MARK: - Add UIToolbar above keyboard
    
    func addDoneButtonOnKeyboard() {
        let doneToolBar = UIToolbar(
            frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 30)
        )
        doneToolBar.barStyle = .default
        
        let flexSpaceItem = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace, target: nil, action: nil
        )
        let doneButtonItem = UIBarButtonItem(
            title: Resources.Strings.MainController.doneKeyboardButton,
            style: .done,
            target: self,
            action: #selector(keyboardButtonAction)
        )
        doneButtonItem.tintColor = Resources.Colors.Accent.accentMain
        
        let items = [flexSpaceItem, doneButtonItem]
        doneToolBar.items = items
        doneToolBar.sizeToFit()
        
        textField.inputAccessoryView = doneToolBar
    }
}

extension BaseTextField: UITextFieldDelegate {
    
    // TextField Active State
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        viewModel.changePlaceholder(newValue: nil)
        
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
        
        viewModel.changeText(newValue: text)
        
//        if text.isEmpty {
//            viewModel.changePlaceholder(
//                newValue: Resources.Strings.MainController.AddDayGoalController.placeholder
//            )
//        }
    }
}

@objc extension BaseTextField {
    func keyboardButtonAction() {
        textField.resignFirstResponder()
    }
}
