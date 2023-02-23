//
//  AppDelegate.swift
//  Waterly App
//
//  Created by Olegio on 26.12.2022.
//

import UIKit
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let notificationCenter = UNUserNotificationCenter.current()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UIApplication.shared.applicationIconBadgeNumber = 0
        requestAuthorization()
        checkDate()
        return true
    }
    
//    func applicationDidBecomeActive(_ application: UIApplication) {
//        UIApplication.shared.applicationIconBadgeNumber = 0
//    }
    
    func requestAuthorization() {
        
        notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            
            print("Permission granted: \(granted)")
            
            guard granted else { return }
            
            self.getNotificationSettings()
        }
    }
    
    func getNotificationSettings() {
        
        notificationCenter.getNotificationSettings { settings in
            
            print("Notification settings: \(settings)")
        }
    }
    
    func scheduleNotification(notificationType: String) {
        
        let content = UNMutableNotificationContent()
        
        content.title = notificationType
        content.body = "Добавьте воду, чтобы следить за тем, сколько выпили сегодня"
        content.sound = UNNotificationSound.default
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5,
                                                        repeats: false)
        
        let identifier = "Local notification"
        
        let request = UNNotificationRequest(identifier: identifier,
                                            content: content,
                                            trigger: trigger)
        
        notificationCenter.add(request) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}

// MARK: - Check date

private extension AppDelegate {
    
    func checkDate() {
        let currentDate = Date()
        let currentStringFromDate = currentDate.fullDate
        
        DateManager.shared.getSavedDate { result in
            switch result {
            case .success(let savedDate):
                print("SAVED DATE: \(savedDate)")
                
                let savedStringFromDate = savedDate.fullDate
                
                if currentStringFromDate != savedStringFromDate {
                    
                    DateManager.shared.saveDate(currentDate)
                    
                    if let waterDayProgress = UserDataManager.shared.getWaterProgress(
                        for: Resources.Keys.waterProgressKey
                    ) {
                        
                        let dayWaterCapacity = WaterCapacity(
                            capacity: waterDayProgress,
                            date: savedDate
                        )
                        WaterDataManager.shared.saveWaterCapacity(
                            dayWaterCapacity,
                            for: Resources.Keys.weekProgressKey
                        )
                        UserDataManager.shared.removeWaterProgress(
                            for: Resources.Keys.waterProgressKey
                        )
                        WaterDataManager.shared.removeDayWaterProgress()
                    }
                }
            case .failure(let error):
                print(error)
                DateManager.shared.saveDate(currentDate)
            }
        }
    }
}

