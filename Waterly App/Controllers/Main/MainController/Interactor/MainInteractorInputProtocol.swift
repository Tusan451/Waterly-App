//
//  MainInteractorInputProtocol.swift
//  Waterly App
//
//  Created by Olegio on 09.02.2023.
//

import Foundation

protocol MainInteractorInputProtocol {
    init(_ presenter: MainInteractorOutputProtocol)
    func provideNavigationBarLabels()
    func provideDashboardInfoValues()
    func provideGoalViewDefault()
    func provideWaterGoalValue()
    func provideWaterProgress()
    func provideWaterHistoryTitle()
    func provideWaterHistoryValues()
}
