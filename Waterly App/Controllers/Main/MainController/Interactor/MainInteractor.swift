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
                userName = Resources.Strings.MainController.defaultUserName
            }
        }
        presenter.receiveMainTitle(title: mainTitle)
        print("MAINTITLE: \(mainTitle)")
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
}
