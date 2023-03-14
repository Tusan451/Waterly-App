//
//  MainViewOutputProtocol.swift
//  Waterly App
//
//  Created by Olegio on 09.02.2023.
//

import Foundation

protocol MainViewOutputProtocol {
    init(_ view: MainViewInputProtocol)
    func provideNavigationBarLabels()
    func provideDashboardInfoValues()
    func provideGoalViewDefault()
    func provideWaterGoalValue()
    func provideWaterProgress()
    func editButtonDidPressed()
    func addWaterButtonDidPressed()
    func provideWaterHistoryTitle()
    func provideWaterHistoryValues()
    func provideWeeklySummaryTitle()
    func provideWeeklySummary()
    func provideWeeklyStatisticDefault()
}
