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
}
