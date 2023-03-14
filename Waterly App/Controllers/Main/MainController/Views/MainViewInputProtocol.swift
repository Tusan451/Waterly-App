//
//  MainViewInputProtocol.swift
//  Waterly App
//
//  Created by Olegio on 09.02.2023.
//

import Foundation

protocol MainViewInputProtocol: AnyObject {
    func setNavigationBarTitle(navBarTitle: String)
    func setMainTitle(title: String)
    func setDailyWaterView(title: String, image: String, value: String)
    func setActivityView(title: String, image: String, activityType: ActivityType)
    func setGoalViewDefaults(title: String, image: String)
    func setWaterGoalValue(value: String)
    func setWaterProgress(progress: Double, goal: Double, percent: CGFloat)
    func setWaterHistoryTitle(title: String)
    func setWaterCapacity(capacity: [WaterCapacity])
    func setWeeklySummaryTitle(title: String)
    func setWeeklySummary(summary: [WeekWaterStatistic])
    func setGoalsDefault(title: String, imageName: String, type: ActivityType)
    func setAverageDefault(title: String, imageName: String, type: ActivityType)
}
