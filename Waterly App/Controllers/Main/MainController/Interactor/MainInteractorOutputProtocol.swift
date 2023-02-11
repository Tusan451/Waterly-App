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
}
