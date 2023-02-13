//
//  UserSettingsMainView.swift
//  Waterly App
//
//  Created by Olegio on 02.02.2023.
//

import UIKit

protocol UserSettingsMainViewDelegate: AnyObject {
    
    func maleRadioButtonDidPressed()
    func femaleRadioButtonDidPressed()
    func sliderChanged()
    func saveButtonAction()
}

final class UserSettingsMainView: BaseView {
    
    weak var delegate: UserSettingsMainViewDelegate?
    
    let nameTextFieldView = UserBaseTextFieldView(
        width: UIScreen.main.bounds.width - 40,
        height: 50,
        keyboardType: .default
    )
    
    let selectGenderView = GenderView()
    
    let ageTextFieldView = UserBaseTextFieldView(
        width: UIScreen.main.bounds.width / 3 - 40,
        height: 50,
        keyboardType: .numberPad
    )
    
    let heightTextFieldView = UserBaseTextFieldView(
        width: UIScreen.main.bounds.width / 3 - 40,
        height: 50,
        keyboardType: .numberPad
    )
    
    let weightTextFieldView = UserBaseTextFieldView(
        width: UIScreen.main.bounds.width / 3 - 40,
        height: 50,
        keyboardType: .numberPad
    )
    
    private let textFieldsStackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 20
        view.distribution = .fillEqually
        return view
    }()
    
    let physicalActivityView = PhysicalActivityView()
    
    let saveButton = CustomButton(with: .fill)
    
    let disclaimerLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProMedium(size: 10)
        label.textColor = Resources.Colors.Text.textTertiary
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
}

extension UserSettingsMainView {
    
    override func addViews() {
        super.addViews()
        
        addView(nameTextFieldView)
        addView(selectGenderView)
        addView(textFieldsStackView)
        addView(physicalActivityView)
        addView(saveButton)
        addView(disclaimerLabel)
        
        textFieldsStackView.addArrangedSubview(ageTextFieldView)
        textFieldsStackView.addArrangedSubview(heightTextFieldView)
        textFieldsStackView.addArrangedSubview(weightTextFieldView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            
            // MARK: - nameTextFieldView
            
            nameTextFieldView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 20
            ),
            nameTextFieldView.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: 32
            ),
            nameTextFieldView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -20
            ),
            nameTextFieldView.bottomAnchor.constraint(
                equalTo: selectGenderView.topAnchor,
                constant: -24
            ),
            
            // MARK: - selectGenderView
            
            selectGenderView.leadingAnchor.constraint(
                equalTo: nameTextFieldView.leadingAnchor
            ),
            selectGenderView.topAnchor.constraint(
                equalTo: nameTextFieldView.bottomAnchor,
                constant: 24
            ),
            selectGenderView.trailingAnchor.constraint(
                equalTo: nameTextFieldView.trailingAnchor
            ),
            selectGenderView.bottomAnchor.constraint(
                equalTo: textFieldsStackView.topAnchor,
                constant: -24
            ),
            
            // MARK: - textFieldsStackView
            
            textFieldsStackView.leadingAnchor.constraint(
                equalTo: nameTextFieldView.leadingAnchor
            ),
            textFieldsStackView.topAnchor.constraint(
                equalTo: selectGenderView.bottomAnchor,
                constant: 24
            ),
            textFieldsStackView.trailingAnchor.constraint(
                equalTo: nameTextFieldView.trailingAnchor
            ),
            textFieldsStackView.bottomAnchor.constraint(
                equalTo: physicalActivityView.topAnchor,
                constant: -24
            ),
            
            // MARK: - physicalActivityView
            
            physicalActivityView.leadingAnchor.constraint(
                equalTo: nameTextFieldView.leadingAnchor
            ),
            physicalActivityView.topAnchor.constraint(
                equalTo: textFieldsStackView.bottomAnchor,
                constant: 24
            ),
            physicalActivityView.trailingAnchor.constraint(
                equalTo: nameTextFieldView.trailingAnchor
            ),
            
            // MARK: - saveButton
            
            saveButton.leadingAnchor.constraint(
                equalTo: nameTextFieldView.leadingAnchor
            ),
            saveButton.trailingAnchor.constraint(
                equalTo: nameTextFieldView.trailingAnchor
            ),
            saveButton.bottomAnchor.constraint(
                equalTo: disclaimerLabel.topAnchor,
                constant: -12
            ),
            saveButton.heightAnchor.constraint(
                equalToConstant: 50
            ),
            
            // MARK: - disclaimerLabel
            
            disclaimerLabel.leadingAnchor.constraint(
                equalTo: nameTextFieldView.leadingAnchor
            ),
            disclaimerLabel.topAnchor.constraint(
                equalTo: saveButton.bottomAnchor,
                constant: 12
            ),
            disclaimerLabel.trailingAnchor.constraint(
                equalTo: nameTextFieldView.trailingAnchor
            ),
            disclaimerLabel.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.bottomAnchor,
                constant: -32
            )
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
        saveButton.setColor(for: Resources.Colors.Accent.accentMain, title: .white)
        saveButton.addTarget(self, action: #selector(saveButtonAction), for: .touchUpInside)
        
        selectGenderView.maleRadioButton.addTarget(self,
                                                   action: #selector(maleRadioButtonTapped),
                                                   for: .touchUpInside)
        
        selectGenderView.femaleRadioButton.addTarget(self,
                                                     action: #selector(femaleRadioButtonTapped),
                                                     for: .touchUpInside)
        
        physicalActivityView.physicalActivitySlider.addTarget(self,
                                                              action: #selector(sliderChanged),
                                                              for: .valueChanged)
    }
}

@objc extension UserSettingsMainView {
    
    func maleRadioButtonTapped() {
        delegate?.maleRadioButtonDidPressed()
    }
    
    func femaleRadioButtonTapped() {
        delegate?.femaleRadioButtonDidPressed()
    }
    
    func sliderChanged() {
        delegate?.sliderChanged()
    }
    
    func saveButtonAction() {
        delegate?.saveButtonAction()
    }
}
