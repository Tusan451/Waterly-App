//
//  HeaderView.swift
//  Waterly App
//
//  Created by Olegio on 27.12.2022.
//

import UIKit

final class HeaderView: BaseView {
    
    private let greetingsLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProSemibold(size: 32)
        label.textColor = Resources.Colors.Text.textMain
        return label
    }()
    
    private let motivationLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProRegular(size: 16)
        label.textColor = Resources.Colors.Text.textSecondary
        return label
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 8
        return view
    }()
    
    // TODO: - Изменить функцию приветствия в зависимости от имени пользователя
    func configureGreetingsLabel(with name: String) {
        greetingsLabel.text = "Привет, \(name)!"
    }
    
    // TODO: - Изменить лейбл мотивации в зависимости от кол-ва выпитой воды за день
    func configureMotivationLabel(with title: String) {
        motivationLabel.text = title
    }
}

extension HeaderView {
    
    override func addViews() {
        super.addViews()
        
        addView(stackView)
        stackView.addArrangedSubview(greetingsLabel)
        stackView.addArrangedSubview(motivationLabel)
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
        
        backgroundColor = Resources.Colors.Back.backMain
    }
}
