//
//  FinalPageMainView.swift
//  Waterly App
//
//  Created by Olegio on 27.01.2023.
//

import UIKit

protocol FinalPageMainViewDelegate: AnyObject {
    
    func maleRadioButtonDidPressed()
    func femaleRadioButtonDidPressed()
    func sliderChanged()
    func saveButtonAction()
}

final class FinalPageMainView: BaseView {
    
    weak var delegate: FinalPageMainViewDelegate?
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProMedium(size: 28)
        label.text = Resources.Strings.NewUserPageVC.FinalPage.title
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let nameTextFieldView = NameTextFieldView()
    
    private let selectGenderView = SelectGenderView()
    
    private let birthDateView = BirthDateView()
    
    private let heightWeightView = HeightWeightView()
    
    private let physicalActivityView = PhysicalActivityView()
    
    private let saveButton = CustomButton(with: .fill)
    
    let disclaimerLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProMedium(size: 10)
        label.text = Resources.Strings.NewUserPageVC.FinalPage.disclaimer
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
}

extension FinalPageMainView {
    
    override func addViews() {
        super.addViews()
        
        addView(titleLabel)
        addView(nameTextFieldView)
        addView(selectGenderView)
        addView(birthDateView)
        addView(heightWeightView)
        addView(physicalActivityView)
        addView(saveButton)
        addView(disclaimerLabel)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            titleLabel.bottomAnchor.constraint(equalTo: nameTextFieldView.topAnchor, constant: -24),
            
            nameTextFieldView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            nameTextFieldView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            nameTextFieldView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            nameTextFieldView.bottomAnchor.constraint(equalTo: selectGenderView.topAnchor, constant: -24),
            
            selectGenderView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            selectGenderView.topAnchor.constraint(equalTo: nameTextFieldView.bottomAnchor, constant: 24),
            selectGenderView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            selectGenderView.bottomAnchor.constraint(equalTo: birthDateView.topAnchor, constant: -24),
            
            birthDateView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            birthDateView.topAnchor.constraint(equalTo: selectGenderView.bottomAnchor, constant: 24),
            birthDateView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            birthDateView.bottomAnchor.constraint(equalTo: heightWeightView.topAnchor, constant: -24),
            
            heightWeightView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            heightWeightView.topAnchor.constraint(equalTo: birthDateView.bottomAnchor, constant: 24),
            heightWeightView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            heightWeightView.bottomAnchor.constraint(equalTo: physicalActivityView.topAnchor, constant: -24),
            
            physicalActivityView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            physicalActivityView.topAnchor.constraint(equalTo: heightWeightView.bottomAnchor, constant: 24),
            physicalActivityView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            physicalActivityView.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -24),
            
            saveButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            saveButton.topAnchor.constraint(equalTo: physicalActivityView.bottomAnchor, constant: 24),
            saveButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            saveButton.bottomAnchor.constraint(equalTo: disclaimerLabel.topAnchor, constant: -12),
            saveButton.heightAnchor.constraint(equalToConstant: 50),
            
            disclaimerLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            disclaimerLabel.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 12),
            disclaimerLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
        selectGenderView.maleRadioButton.addTarget(self,
                                                   action: #selector(maleRadioButtonTapped),
                                                   for: .touchUpInside)
        
        selectGenderView.femaleRadioButton.addTarget(self,
                                                     action: #selector(femaleRadioButtonTapped),
                                                     for: .touchUpInside)
        
        physicalActivityView.physicalActivitySlider.addTarget(self,
                                                              action: #selector(sliderChanged),
                                                              for: .touchUpInside)
        
        saveButton.setColor(for: .white, title: Resources.Colors.Accent.accentMain)
        saveButton.setTitle(with: Resources.Strings.NewUserPageVC.FinalPage.saveButtonTitle)
        saveButton.addTarget(self, action: #selector(saveButtonAction), for: .touchUpInside)
    }
}

@objc extension FinalPageMainView {
    
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
