//
//  MainView.swift
//  Waterly App
//
//  Created by Olegio on 09.02.2023.
//

import UIKit

protocol MainViewDelegate: AnyObject {
    
    func editButtonDidPressed()
    func addWaterButtonDidPressed()
}

final class MainView: BaseView {
    
    weak var delegate: MainViewDelegate?
    
    private let scrollView = UIScrollView()
    let headerView = HeaderView()
    let dashboardInfoView = DashboardInfoView()
    let counterView = CounterView()
    let waterHistoryView = WaterHistoryView()
    let weeklySummaryView = WeeklySummaryView()
}

extension MainView {
    
    override func addViews() {
        super.addViews()
        
        scrollView.addView(headerView)
        scrollView.addView(dashboardInfoView)
        scrollView.addView(counterView)
        scrollView.addView(waterHistoryView)
        scrollView.addView(weeklySummaryView)
        
        addView(scrollView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            headerView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 8),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            headerView.bottomAnchor.constraint(equalTo: dashboardInfoView.topAnchor, constant: -20),
            
            dashboardInfoView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            dashboardInfoView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            dashboardInfoView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            dashboardInfoView.bottomAnchor.constraint(equalTo: counterView.topAnchor, constant: -32),

            counterView.topAnchor.constraint(equalTo: dashboardInfoView.bottomAnchor, constant: 32),
            counterView.leadingAnchor.constraint(equalTo: dashboardInfoView.leadingAnchor),
            counterView.trailingAnchor.constraint(equalTo: dashboardInfoView.trailingAnchor),
            counterView.bottomAnchor.constraint(equalTo: waterHistoryView.topAnchor, constant: -32),
            
            waterHistoryView.topAnchor.constraint(equalTo: counterView.bottomAnchor, constant: 32),
            waterHistoryView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            waterHistoryView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            waterHistoryView.bottomAnchor.constraint(equalTo: weeklySummaryView.topAnchor, constant: -32),
            
            weeklySummaryView.topAnchor.constraint(equalTo: waterHistoryView.bottomAnchor, constant: 32),
            weeklySummaryView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            weeklySummaryView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            weeklySummaryView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -32)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        headerView.configureMotivationLabel(with: "Не забывай пить воду.")
        
        counterView.addWaterButton.addTarget(self, action: #selector(addWaterButtonTapped), for: .touchUpInside)
        counterView.goalView.editButton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
    }
}

@objc extension MainView {
    
    func editButtonTapped() {
        delegate?.editButtonDidPressed()
    }
    
    func addWaterButtonTapped() {
        delegate?.addWaterButtonDidPressed()
    }
}
