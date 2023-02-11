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
    
    required init(_ view: MainViewInputProtocol) {
        self.view = view
    }
    
    func provideNavigationBarLabels() {
        interactor.provideNavigationBarLabels()
    }
    
    func provideDashboardInfoValues() {
        interactor.provideDashboardInfoValues()
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
}
