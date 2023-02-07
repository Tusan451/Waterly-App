//
//  UserBaseTextFieldView.swift
//  Waterly App
//
//  Created by Olegio on 02.02.2023.
//

import UIKit

final class UserBaseTextFieldView: BaseView {
    
    private let width: CGFloat!
    private let height: CGFloat!
        
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProRegular(size: 14)
        label.textColor = Resources.Colors.Text.textSecondary
        return label
    }()
    
    let textField: BaseTextField!
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 12
        return view
    }()
    
    init(width: CGFloat, height: CGFloat, keyboardType: UIKeyboardType) {
        
        self.width = width
        self.height = height
        
        textField = BaseTextField(
            width: self.width,
            height: self.height,
            backgroundColor: Resources.Colors.Back.backSecondary,
            keyboardType: keyboardType
        )
        
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(_ title: String) {
        titleLabel.text = title
    }
    
//    func getCurrentTextFieldText() -> String {
//        textField.viewModel.text ?? ""
//    }
}

extension UserBaseTextFieldView {
    
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
