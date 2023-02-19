//
//  MainPresenter.swift
//  Waterly App
//
//  Created by Olegio on 09.02.2023.
//

import Foundation

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
}

// MARK: - MainInteractorOutputProtocol

extension MainPresenter: MainInteractorOutputProtocol {
    
    func receiveMainTitle(title: String) {
        view.setMainTitle(title: title)
    }
    
    func receiveUserName(name: String) {
        let navigationTitle = "Привет, \(name)!"
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
        let waterProgress: Double = progress != nil ? Double(progress!) : 0
        let waterGoal: Double = goal != nil ? Double(goal!) : 0
        
        let tempCurrentValue = waterProgress > waterGoal ? waterGoal : waterProgress
        let goalValueDivider = waterGoal == 0 ? 1 : waterGoal
        let percent = tempCurrentValue / goalValueDivider
        
        view.setWaterProgress(
            progress: waterProgress,
            goal: waterGoal,
            percent: CGFloat(percent)
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
}
