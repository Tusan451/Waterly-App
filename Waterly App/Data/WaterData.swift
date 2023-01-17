//
//  WaterData.swift
//  Waterly App
//
//  Created by Olegio on 12.01.2023.
//

import Foundation

// MARK: - Рекомендуемая дневная норма воды
let recommendDailyValue = 2000

// MARK: - Параметр цели дня из БД
var dayGoal = 2000

// MARK: - Параметр дневного прогресса из БД
var dayProgress = 1200

// MARK: - Данные статистики выпитой воды из БД
struct WaterData {
    let value: Int
    let title: String
}

// MARK: - Недавно добавленная вода в мл
struct RecentlyAddedWater {
    let value: Int
}

var recentlyAddedWater: [RecentlyAddedWater] = []
