//
//  WaterData.swift
//  Waterly App
//
//  Created by Olegio on 12.01.2023.
//

import Foundation

// MARK: - Параметр цели дня из БД
let dayGoal = 2000

// MARK: - Параметр дневного прогресса из БД
let dayProgress = 1200

// MARK: - Данные статистики выпитой воды из БД
struct WaterData {
    let value: Int
    let title: String
}
