//
//  MainInteractorOutputProtocol.swift
//  Waterly App
//
//  Created by Olegio on 09.02.2023.
//

import Foundation

protocol MainInteractorOutputProtocol: AnyObject {
    func receiveMainTitle(title: String)
    func receiveUserName(name: String)
    func receiveDailyWaterValues(title: String, image: String, value: Int)
    func receiveActivityValues(title: String, image: String, activityType: ActivityType)
    func receiveGoalViewDefaults(title: String, image: String)
    func receiveWaterGoal(value: Int)
    func receiveWaterProgress(progress: Int?, goal: Int?)
    func receiveWaterHistoryTitle(title: String)
    func receiveWaterHistoryValues(values: [WaterCapacity]?)
    func receiveWeeklySummaryTitle(title: String)
    func receiveWeeklySummary(summary: [WaterCapacity])
    func receiveGoalsDefault(title: String, imageName: String, type: ActivityType)
    func receiveAverageDefault(title: String, imageName: String, type: ActivityType)
}
