//
//  MainPresenter.swift
//  Waterly App
//
//  Created by Olegio on 09.02.2023.
//

import Foundation

struct WeekWaterStatistic {
    let capacity: Int
    let date: String?
}

class MainPresenter: MainViewOutputProtocol {
    unowned let view: MainViewInputProtocol
    var interactor: MainInteractorInputProtocol!
    var router: MainRouterInputProtocol!
    
    required init(_ view: MainViewInputProtocol) {
        self.view = view
    }
    
    func provideNavigationBarLabels() {
        interactor.provideNavigationBarLabels()
    }
    
    func provideDashboardInfoValues() {
        interactor.provideDashboardInfoValues()
    }
    
    func provideGoalViewDefault() {
        interactor.provideGoalViewDefault()
    }
    
    func provideWaterGoalValue() {
        interactor.provideWaterGoalValue()
    }
    
    func provideWaterProgress() {
        interactor.provideWaterProgress()
    }
    
    func editButtonDidPressed() {
        router.goToAddDayGoalModule()
    }
    
    func addWaterButtonDidPressed() {
        router.goToAddWaterModule()
    }
    
    func provideWaterHistoryTitle() {
        interactor.provideWaterHistoryTitle()
    }
    
    func provideWaterHistoryValues() {
        interactor.provideWaterHistoryValues()
    }
    
    func provideWeeklySummaryTitle() {
        interactor.provideWeeklySummaryTitle()
    }
    
    func provideWeeklySummary() {
        interactor.provideWeeklySummary()
    }
    
    func provideWeeklyStatisticDefault() {
        interactor.provideWeeklyStatisticDefault()
    }
}

// MARK: - MainInteractorOutputProtocol

extension MainPresenter: MainInteractorOutputProtocol {
    
    func receiveMainTitle(title: String) {
        view.setMainTitle(title: title)
    }
    
    func receiveUserName(name: String) {
        let title = name.isEmpty ? "Привет!" : "Привет, \(name)!"
        let navigationTitle = title
        view.setNavigationBarTitle(navBarTitle: navigationTitle)
    }
    
    func receiveDailyWaterValues(title: String, image: String, value: Int) {
        let waterRate = "\(value) мл"
        view.setDailyWaterView(title: title, image: image, value: waterRate)
    }
    
    func receiveActivityValues(title: String, image: String, activityType: ActivityType) {
        view.setActivityView(title: title, image: image, activityType: activityType)
    }
    
    func receiveGoalViewDefaults(title: String, image: String) {
        view.setGoalViewDefaults(title: title, image: image)
    }
    
    func receiveWaterGoal(value: Int) {
        let waterGoal = "\(value) мл"
        view.setWaterGoalValue(value: waterGoal)
    }
    
    func receiveWaterProgress(progress: Int?, goal: Int?) {
        let percentValue = goal == nil ? 0 : lround(Double(progress ?? 0) / Double((goal ?? 0) / 100))
                
        view.setWaterProgress(
            progress: Double(progress ?? 0),
            goal: Double(goal ?? 0),
            percent: CGFloat(percentValue)
        )
    }
    
    func receiveWaterHistoryTitle(title: String) {
        view.setWaterHistoryTitle(title: title)
    }
    
    func receiveWaterHistoryValues(values: [WaterCapacity]?) {
        if let values = values {
            view.setWaterCapacity(capacity: values)
        } else {
            view.setWaterCapacity(capacity: [])
        }
    }
    
    func receiveWeeklySummaryTitle(title: String) {
        view.setWeeklySummaryTitle(title: title)
    }
    
    func receiveWeeklySummary(summary: [WaterCapacity]) {
        var weekWaterStatistic: [WeekWaterStatistic] = []
        
        summary.forEach {
            weekWaterStatistic.append(
                WeekWaterStatistic(capacity: $0.capacity, date: $0.date?.shortDate)
            )
        }
        
        view.setWeeklySummary(summary: weekWaterStatistic)
    }
    
    func receiveGoalsDefault(title: String, imageName: String, type: ActivityType) {
        view.setGoalsDefault(title: title, imageName: imageName, type: type)
    }
    
    func receiveAverageDefault(title: String, imageName: String, type: ActivityType) {
        view.setAverageDefault(title: title, imageName: imageName, type: type)
    }
}
