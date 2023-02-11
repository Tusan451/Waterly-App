//
//  CounterView.swift
//  Waterly App
//
//  Created by Olegio on 28.12.2022.
//

import UIKit

final class CounterView: BaseView {
    
    private let progressView = ProgressView()
    
    private var counterProgress: CGFloat = 0
    private var counterGoal = 0.0
    
    private let percentProgressValueLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProSemibold(size: 32)
        label.textColor = Resources.Colors.Text.textMain
        label.textAlignment = .center
        return label
    }()
    
    private let waterProgressValueLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProMedium(size: 13)
        label.textColor = Resources.Colors.Text.textSecondary
        label.textAlignment = .center
        return label
    }()
    
    private let labelsStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillProportionally
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
    
    private let addWaterButton = CustomButton(with: .fill)
    
    // Конфигурация счетчика воды
    func configure(goal: Double, progress: Double) {
        counterGoal = goal
        
        let tempCurrentValue = progress > goal ? goal : progress
        let goalValueDivider = goal == 0 ? 1 : goal
        let percent = tempCurrentValue / goalValueDivider
        
        progressView.drawProgress(with: CGFloat(percent))
        valueLabelsAnimate(goal: goal, progress: progress)
    }
    
    func configureDailyGoalValue(_ value: Int) {
        goalView.setValueLabel(with: value)
    }
    
    // Действие для кнопки изменения цели дня
    func editButtonAddAction(selector: Selector, target: Any?) {
        goalView.addEditButtonAction(selector, target: target)
    }
    
    // Действие для кнопки добавления воды
    func addWaterButtonAction(selector: Selector, target: Any?) {
        addWaterButton.addTarget(target, action: selector, for: .touchUpInside)
    }
}

extension CounterView {
    
    override func addViews() {
        super.addViews()
        
        addView(addWaterButton)
        addView(stackView)
        addView(labelsStackView)
        labelsStackView.addArrangedSubview(percentProgressValueLabel)
        labelsStackView.addArrangedSubview(waterProgressValueLabel)
        stackView.addArrangedSubview(progressView)
        stackView.addArrangedSubview(goalView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            progressView.trailingAnchor.constraint(equalTo: goalView.leadingAnchor, constant: -40),
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor),
            
            labelsStackView.centerXAnchor.constraint(equalTo: progressView.centerXAnchor),
            labelsStackView.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
            
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
                
//        goalView.setValueLabel(with: dayGoal)
//        goalView.addEditButtonAction(#selector(editButtonTapped), target: self)
        
        addWaterButton.setTitle(with: Resources.Strings.MainController.addWaterButton)
        addWaterButton.setColor(for: Resources.Colors.Accent.accentMain, title: .white)
//        addWaterButton.addTarget(self, action: #selector(addWaterButtonTapped), for: .touchUpInside)
    }
}

//@objc extension CounterView {
//
//    // TODO: - Вызов поп-ап окна с изменением дневной нормы
//    func editButtonTapped() {
//        print("edit button tapped")
//    }
//
//    // TODO: - Добавление выпитой воды
//    func addWaterButtonTapped() {
//        print("waterButton tapped")
//    }
//}

private extension CounterView {
    
    func valueLabelsAnimate(goal: Double, progress: Double) {
        var water = 0
        var labelPercent = 0
        
        let waterProgressTimer = Timer.scheduledTimer(withTimeInterval: 0.00001,
                                         repeats: true) { [weak self] timer in
            guard let self = self else { return }
            water += 1
            self.waterProgressValueLabel.text = "\(water) мл"
            
            if water == Int(progress) {
                timer.invalidate()
            }
        }
        
        let percentProgressTimer = Timer.scheduledTimer(withTimeInterval: 0.01,
                             repeats: true) { [weak self] timer in
            guard let self = self else { return }
            labelPercent += 1
            self.percentProgressValueLabel.text = "\(labelPercent)%"
            
            if labelPercent == lround(progress / (goal / 100)) {
                timer.invalidate()
            }
        }
        
        RunLoop.main.add(waterProgressTimer, forMode: .common)
        RunLoop.main.add(percentProgressTimer, forMode: .common)
    }
}
