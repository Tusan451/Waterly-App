//
//  MainViewController.swift
//  Waterly App
//
//  Created by Olegio on 26.12.2022.
//

import UIKit

class MainViewController: BaseController {

    private let headerView = HeaderView()
    private let dashboardInfoView = DashboardInfoView()
    private let counterView = CounterView()
}

extension MainViewController {
    
    override func addViews() {
        super.addViews()
        
        view.addView(headerView)
        view.addView(dashboardInfoView)
        view.addView(counterView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            headerView.bottomAnchor.constraint(equalTo: dashboardInfoView.topAnchor, constant: -24),
            
            dashboardInfoView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            dashboardInfoView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 24),
            dashboardInfoView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            dashboardInfoView.bottomAnchor.constraint(equalTo: counterView.topAnchor, constant: -32),
            
            counterView.topAnchor.constraint(equalTo: dashboardInfoView.bottomAnchor, constant: 32),
            counterView.leadingAnchor.constraint(equalTo: dashboardInfoView.leadingAnchor),
            counterView.trailingAnchor.constraint(equalTo: dashboardInfoView.trailingAnchor)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
        headerView.configureGreetingsLabel(with: "Олег")
        headerView.configureMotivationLabel(with: "Не забывай пить воду.")
        
        counterView.configure(goal: 2000, progress: 2000)
    }
}

