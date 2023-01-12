//
//  Resources.swift
//  Waterly App
//
//  Created by Olegio on 26.12.2022.
//

import UIKit

enum Resources {
    
    enum Colors {
        
        enum Accent {
            static let accentMain = UIColor(named: "AccentMain")
            static let accentInactive = UIColor(named: "AccentInactive")
        }
        
        enum Back {
            static let backMain = UIColor(named: "BackMain")
            static let backSecondary = UIColor(named: "BackSecondary")
            static let textFieldBack = UIColor(named: "TextFieldBack")
            static let tabBarBackColor = UIColor(named: "TabBarBackColor")
        }
        
        enum Separator {
            static let separatorAccent = UIColor(named: "SeparatorAccent")
            static let separatorAccentSecondary = UIColor(named: "SeparatorAccentSecondary")
        }
        
        enum Text {
            static let textMain = UIColor(named: "TextMain")
            static let textSecondary = UIColor(named: "TextSecondary")
            static let textTertiary = UIColor(named: "TextTertiary")
        }
        
        enum Other {
            static let green = UIColor(named: "Green")
            static let red = UIColor(named: "Red")
            static let yellow = UIColor(named: "Yellow")
            static let shadow = UIColor(named: "Shadow")
        }
    }
    
    enum Shadows {
        
        enum TabBar {
            static let offset = CGSize(width: 0, height: -4)
            static let opacity: Float = 0.1
            static let radius: CGFloat = 22
        }
        
        enum MainController {
            static let offset = CGSize(width: 0, height: 4)
            static let opacity: Float = 1
            static let radius: CGFloat = 4
        }
    }
    
    enum Strings {
        
        enum TabBar {
            static let statistics = "Статистика"
            static let main = "Главная"
            static let settings = "Настройки"
        }
        
        enum MainController {
            static let dailyWaterGoal = "Дневная норма"
            static let activityType = "Физ. активность"
            static let daylyGoal = "Цель дня"
            
            static let editButton = "Изменить"
            static let addWaterButton = "Добавить воду"
            
            static let recentlyAdded = "Недавно добавлено"
            static let noAddedWaterLabel = "Сегодня вы еще не добавляли воду"
            
            static let weeklySummary = "Сводка за неделю"
            
            static let hitGoals = "Выполнено целей"
            static let averageDrinked = "В среднем выпили"
        }
    }
    
    enum Images {
        
        enum TabBar {
            static let statistics = UIImage(named: "statistics")
            static let main = UIImage(named: "main")
            static let settings = UIImage(named: "settings")
        }
        
        enum MainController {
            static let water = UIImage(named: "water")
            static let activity = UIImage(named: "activity")
            static let glassOfWater = UIImage(named: "glassOfWater")
        }
    }
    
    enum Fonts {
        
        static func sfProLight(size: CGFloat) -> UIFont {
            UIFont(name: "SFProDisplay-Light", size: size) ?? UIFont()
        }
        static func sfProRegular(size: CGFloat) -> UIFont {
            UIFont(name: "SFProDisplay-Regular", size: size) ?? UIFont()
        }
        static func sfProMedium(size: CGFloat) -> UIFont {
            UIFont(name: "SFProDisplay-Medium", size: size) ?? UIFont()
        }
        static func sfProSemibold(size: CGFloat) -> UIFont {
            UIFont(name: "SFProDisplay-Semibold", size: size) ?? UIFont()
        }
    }
}
