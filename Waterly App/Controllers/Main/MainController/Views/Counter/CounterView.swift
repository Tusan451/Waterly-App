//
//  CounterView.swift
//  Waterly App
//
//  Created by Olegio on 28.12.2022.
//

import UIKit

final class CounterView: BaseView {
    
    private let progressView = ProgressView()
    
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
    
    let goalView = GoalView()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 40
        view.distribution = .fillEqually
        return view
    }()
    
    let addWaterButton = CustomButton(with: .fill)
    
    // Конфигурация счетчика воды
    func configure(goal: Double, progress: Double, percent: CGFloat) {
        
        let tempCurrentValue = progress > goal ? goal : progress
        let goalValueDivider = goal == 0 ? 1 : goal
        let percent = (ceil(tempCurrentValue / goalValueDivider * 100)) / 100
                
        progressView.drawProgress(with: percent)
        valueLabelsAnimate(goal: goal, progress: progress)
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
        
        addWaterButton.setTitle(with: Resources.Strings.MainController.addWaterButton)
        addWaterButton.setColor(for: Resources.Colors.Accent.accentMain, title: .white)
    }
}

private extension CounterView {
    
    func valueLabelsAnimate(goal: Double, progress: Double) {
        var water = 0
        var labelPercent = 0
        
        let waterProgressTimer = Timer.scheduledTimer(withTimeInterval: 0.00001,
                                         repeats: true) { [weak self] timer in
            guard let self = self else { return }
            water += 1
            if progress == 0.0 {
                self.waterProgressValueLabel.text = "0 мл"
            } else {
                self.waterProgressValueLabel.text = "\(water) мл"
            }
            
            if water >= Int(progress) {
                timer.invalidate()
            }
        }
        
        let percentProgressTimer = Timer.scheduledTimer(withTimeInterval: 0.01,
                             repeats: true) { [weak self] timer in
            guard let self = self else { return }
            labelPercent += 1
            if progress == 0.0 {
                self.percentProgressValueLabel.text = "0%"
            } else {
                self.percentProgressValueLabel.text = "\(labelPercent)%"
            }
            
            if labelPercent == lround(progress / (goal / 100)) {
                timer.invalidate()
            }
        }
        
        RunLoop.main.add(waterProgressTimer, forMode: .common)
        RunLoop.main.add(percentProgressTimer, forMode: .common)
    }
}
