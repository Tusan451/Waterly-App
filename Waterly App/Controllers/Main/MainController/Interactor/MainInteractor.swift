//
//  MainInteractor.swift
//  Waterly App
//
//  Created by Olegio on 09.02.2023.
//

import Foundation

class MainInteractor: MainInteractorInputProtocol {
    unowned let presenter: MainInteractorOutputProtocol
    
    required init(_ presenter: MainInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func provideNavigationBarLabels() {
        let mainTitle = Resources.Strings.TabBar.main
        var userName = ""
        
        UserDataManager.shared.getUserData { result in
            switch result {
            case .success(let userData):
                print("USERDATA: \(userData)")
                userName = userData.name
            case .failure(let error):
                print("ERROR: \(error)")
                userName = ""
            }
        }
        presenter.receiveMainTitle(title: mainTitle)
        presenter.receiveUserName(name: userName)
    }
    
    func provideDashboardInfoValues() {
        let dailyWaterGoalTitle = Resources.Strings.MainController.dailyWaterGoal
        let dailyWaterGoalImage = Resources.Strings.MainController.waterImageName
        var waterRateValue = 0
        
        let activityModeTitle = Resources.Strings.MainController.activityType
        let activityModeImage = Resources.Strings.MainController.activityImageName
        var activityType: ActivityType = .medium
        
        UserDataManager.shared.getUserData { result in
            switch result {
            case .success(let data):
                
                if let waterRate = UserDataManager.shared.getWaterRate(for: "\(data.id)") {
                    waterRateValue = waterRate
                } else {
                    waterRateValue = 0
                }
                
                switch data.activity {
                case .low:
                    activityType = .low
                case .medium:
                    activityType = .medium
                case .high:
                    activityType = .high
                }
                
            case .failure(_):
                waterRateValue = 0
                activityType = .medium
            }
        }
        
        presenter.receiveDailyWaterValues(
            title: dailyWaterGoalTitle,
            image: dailyWaterGoalImage,
            value: waterRateValue
        )
        presenter.receiveActivityValues(
            title: activityModeTitle,
            image: activityModeImage,
            activityType: activityType
        )
    }
    
    func provideGoalViewDefault() {
        let title = Resources.Strings.MainController.daylyGoal
        let image = Resources.Strings.MainController.waterImageName
        presenter.receiveGoalViewDefaults(title: title, image: image)
    }
    
    func provideWaterGoalValue() {
        let waterGoal = UserDataManager.shared.getWaterGoal(for: Resources.Keys.waterGoalKey)
        waterGoal == nil ? presenter.receiveWaterGoal(value: 0) :
        presenter.receiveWaterGoal(value: waterGoal!)
    }
    
    func provideWaterProgress() {
        let waterGoal = UserDataManager.shared.getWaterGoal(for: Resources.Keys.waterGoalKey)
        let waterProgress = UserDataManager.shared.getWaterProgress(for: Resources.Keys.waterProgressKey)
        presenter.receiveWaterProgress(progress: waterProgress, goal: waterGoal)
    }
    
    func provideWaterHistoryTitle() {
        let title = Resources.Strings.MainController.recentlyAdded
        presenter.receiveWaterHistoryTitle(title: title)
    }
    
    func provideWaterHistoryValues() {
        var waterCapacity: [WaterCapacity]? = []
        
        WaterDataManager.shared.getWaterProgress(
            for: Resources.Keys.dayProgressKey) { result in
                switch result {
                case .success(let data):
                    waterCapacity = data.progressArray
                case .failure(let error):
                    print(error)
                }
            }
        
        presenter.receiveWaterHistoryValues(values: waterCapacity)
    }
    
    func provideWeeklySummaryTitle() {
        let title = Resources.Strings.MainController.weeklySummary
        presenter.receiveWeeklySummaryTitle(title: title)
    }
    
    func provideWeeklySummary() {
        var weeklySummary: [WaterCapacity] = []
        
        WaterDataManager.shared.getWaterProgress(for: Resources.Keys.weekProgressKey) { result in
            switch result {
            case .success(let waterProgress):
                weeklySummary = waterProgress.progressArray
            case .failure(let error):
                print(error)
            }
        }
        presenter.receiveWeeklySummary(summary: weeklySummary)
    }
    
    func provideWeeklyStatisticDefault() {
        let goalsTitle = Resources.Strings.MainController.hitGoals
        let goalsImageName = Resources.Strings.MainController.hitGoalImageName
        let goalsActivityType: ActivityType = .low
        
        let averageTitle = Resources.Strings.MainController.averageDrinked
        let averageImageName = Resources.Strings.MainController.averageWaterImageName
        let averageActivityType: ActivityType = .high
        
        presenter.receiveGoalsDefault(title: goalsTitle,
                                      imageName: goalsImageName,
                                      type: goalsActivityType)
        
        presenter.receiveAverageDefault(title: averageTitle,
                                        imageName: averageImageName,
                                        type: averageActivityType)
    }
}
