//
//  MainViewController.swift
//  Waterly App
//
//  Created by Olegio on 26.12.2022.
//

import UIKit

class MainViewController: BaseController {

    private let scrollView = UIScrollView()
    
    private let headerView = HeaderView()
    private let dashboardInfoView = DashboardInfoView()
    private let counterView = CounterView()
    
    private let waterHistoryView = WaterHistoryView()
    
    private let weeklySummaryView = WeeklySummaryView()
}

extension MainViewController {
    
    override func addViews() {
        super.addViews()
        
        view.addView(headerView)
        
        scrollView.addView(dashboardInfoView)
        scrollView.addView(counterView)
        scrollView.addView(waterHistoryView)
        scrollView.addView(weeklySummaryView)
        view.addView(scrollView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            headerView.bottomAnchor.constraint(equalTo: scrollView.topAnchor, constant: -12),
            
            scrollView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            dashboardInfoView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            dashboardInfoView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 12),
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
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
        headerView.configureGreetingsLabel(with: "Олег")
        headerView.configureMotivationLabel(with: "Не забывай пить воду.")
        
        counterView.configure(goal: 2000, progress: 2000)
        
        scrollView.contentSize = CGSizeMake(self.view.frame.size.width,
                                            self.view.frame.size.height + 500)
        
        waterHistoryView.configure(items: [.init(value: 150),
                                           .init(value: 1000),
                                           .init(value: 250),
                                           .init(value: 180),
                                           .init(value: 0),
                                           .init(value: 0)])
        
        weeklySummaryView.configure(items: [.init(value: 2000, title: "Пн"),
                                            .init(value: 1500, title: "Вт"),
                                            .init(value: 1000, title: "Ср"),
                                            .init(value: 1800, title: "Чт"),
                                            .init(value: 2000, title: "Пт"),
                                            .init(value: 0, title: "Сб"),
                                            .init(value: 1200, title: "Вс")],
                                    size: .short,
                                    type: .week)
    }
}

