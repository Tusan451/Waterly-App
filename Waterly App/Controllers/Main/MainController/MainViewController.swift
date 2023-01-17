//
//  MainViewController.swift
//  Waterly App
//
//  Created by Olegio on 26.12.2022.
//

import UIKit

final class MainViewController: BaseController {

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
                
        scrollView.addView(headerView)
        scrollView.addView(dashboardInfoView)
        scrollView.addView(counterView)
        scrollView.addView(waterHistoryView)
        scrollView.addView(weeklySummaryView)
        
        view.addView(scrollView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            headerView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 8),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
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
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
        navigationBarConfigure()
        
        headerView.configureMotivationLabel(with: "Не забывай пить воду.")
        
        dashboardInfoView.configureWith(recommendDailyValue: recommendDailyValue, and: .low)
        
        counterView.configure(goal: Double(dayGoal), progress: Double(dayProgress))
        counterView.configureDailyGoalValue(dayGoal)
        
        counterView.editButtonAddAction(selector: #selector(editButtonTapped), target: self)
        counterView.addWaterButtonAction(selector: #selector(addWaterButtonTapped), target: self)
        
        scrollView.contentSize = CGSizeMake(self.view.frame.size.width,
                                            self.view.frame.size.height + weeklySummaryView.frame.size.height)
        
        waterHistoryView.configure(items: recentlyAddedWater)
        
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

extension MainViewController: ModalViewControllerDelegate {
    
    func modalControllerWillDisapear(_ modal: BaseController) {
        
        counterView.configure(goal: Double(dayGoal), progress: Double(dayProgress))
        counterView.configureDailyGoalValue(dayGoal)
        
        waterHistoryView.configure(items: recentlyAddedWater)
    }
}

private extension MainViewController {
    
    func navigationBarConfigure() {
        title = "Привет, Олег!"
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.main
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

@objc extension MainViewController {
    
    // MARK: - Вызов поп-ап окна с изменением дневной нормы
    func editButtonTapped() {
        print("edit button tapped")
        
        let editGoalVC = AddDayGoalViewController()
        editGoalVC.delegate = self
        
        self.present(editGoalVC, animated: true)
    }
    
    // MARK: - Добавление выпитой воды
    func addWaterButtonTapped() {
        print("waterButton tapped")
        
        let addWaterVC = AddWaterViewController()
        addWaterVC.delegate = self
        
        self.present(addWaterVC, animated: true)
    }
}
