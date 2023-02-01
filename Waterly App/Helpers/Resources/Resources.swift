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
            static let newUserPresentationBack = UIColor(named: "NewUserPresentationBack")
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
        
        enum NewUserPageVC {
            
            enum FirstPage {
                static let icon = "logoPresentation"
                
                static let mainTitle = "Если есть магия на этой планете, она содержится"
                static let secondaryTitle = "в воде."
                
                static let author = "Лорен Эйсли"
            }
            
            enum SecondPage {
                static let image = "firstScreen"
                static let title = "Не забывай пить воду!"
                static let message = "Приложение рассчитает твою норму и поможет следить за водным балансом"
            }
            
            enum ThirdPage {
                static let image = "secondScreen"
                static let title = "Выполняй цели"
                static let message = "Ты можешь следовать рекомендуемой норме или устанавливать свою цель на день"
            }
            
            enum FourthPage {
                static let image = "thirdScreen"
                static let title = "Добавляй то, что выпил"
                static let message = "Не забывай добавлять выпитую воду, чтобы следить за прогрессом"
            }
            
            enum FivePage {
                static let image = "fourthScreen"
                static let title = "Темная тема"
                static let message = "Выбирай интерфейс под себя с новой темной темой"
            }
            
            enum FinalPage {
                static let title = "Определение нормы воды"
                
                static let nameTextFieldTitle = "Ваше имя"
                static let genderTitle = "Ваш пол"
                static let male = "Я мужчина"
                static let female = "Я женщина"
                
                static let birthDateTextFieldTitle = "Дата рождения"
                static let dayPlaceholder = "дд"
                static let monthPlaceholder = "мм"
                static let yearPlaceholder = "гггг"
                
                static let heightTitle = "Ваш рост"
                static let weightTitle = "Ваш вес"
                static let heightPlaceholder = "см"
                static let weightPlaceholder = "кг"
                
                static let physicalActivityTitle = "Уровень физической активности"
                static let lowPhysicalActivity = "Низкий"
                static let mediumPhysicalActivity = "Средний"
                static let highPhysicalActivity = "Высокий"
                
                static let saveButtonTitle = "Сохранить"
                static let disclaimer = "Мы анализируем полученные данные и считаем рекомендуемую дневную норму воды. Вводите данные как можно точнее."
            }
        }
        
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
            
            enum AddDayGoalController {
                static let dayGoal = "Цель дня"
                static let currentGoal = "Текущая цель дня"
                
                static let reccomendGoalText =
                "Рекомендуемая дневная норма, рассчитанная на основе ваших данных"
                static let saveButton = "Сохранить"
                
                static let dismissButton = "Закрыть"
                static let mililiters = "мл"
                
                static let placeholder = "2000"
            }
            
            enum AddWaterController {
                static let header = "Добавить воду"
                static let textFieldHeader = "Введите кол-во в миллилитрах"
                
                static let dailyPercent = "От дневной нормы"
                static let currentProgress = "Текущий прогресс за день"
                
                static let saveButton = "Добавить воду"
                static let dismissButton = "Закрыть"
                
                static let placeholder = "100"
                static let mililiters = "мл"
            }
        }
        
        enum SettingsModule {
            static let mainControllerTitle = "Настройки"
            static let mainControllerUserSettingsTitle = "Профиль"
            static let mainControllerAppSettingsTitle = "Приложение"
            
            enum AppSettingsModule {
                static let notificationsMainTitle = "Уведомления"
                static let notificationsSecondaryTitle = "Мы будем отправлять вам напоминания, чтобы вы не забывали пить воду"
                static let lightThemeMainTitle = "Светлая тема"
                static let darkThemeMainTitle = "Темная тема"
                static let systemThemeMainTitle = "Системная тема"
            }
        }
        
        enum Alert {
            enum AddDayGoalController {
                static let emptyValueHeader = "Вы не ввели значение в поле"
                
                static let littleValueHeader = "Значение слишком маленькое"
                static let bigValueHeader = "Значение слишком высокое"
                
                static let messageText = "Внесите значение от \(Values.minimumWaterValue) до \(Values.maximumWaterValue)"
                
                static let okAction = "Понятно"
            }
            
            enum AddWaterController {
                static let littleValueHeader = "Значение слишком маленькое"
                static let bigValueHeader = "Значение слишком высокое"
                
                static let messageText = "Внесите значение от \(Values.minimumAddWaterValue) до \(Values.maximumAddWaterValue)"
                
                static let okAction = "Понятно"
            }
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
        
        enum AddWaterViewController {
            static let arrow = UIImage(named: "arrow")
        }
        
        enum RadioButton {
            static let normal = UIImage(named: "radioButtonNormal")
            static let selected = UIImage(named: "radioButtonSelected")
        }
        
        enum SettingsModule {
            static let menuArrow = UIImage(named: "menuArrow")
            static let user = "user"
            static let settings = "settings"
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
    
    enum Values {
        static let minimumWaterValue = 500
        static let maximumWaterValue = 10000
        
        static let minimumAddWaterValue = 50
        static let maximumAddWaterValue = 1000
        
        enum PageVCScreenWidth {
            static let iPhoneSE: CGFloat = 222
            static let iPhone12: CGFloat = 337
            static let iPhoneMini: CGFloat = 325
            static let iPhoneProMax: CGFloat = 380
        }
        
        enum PageVCScreenHeight {
            static let iPhoneSE: CGFloat = 353
            static let iPhone12: CGFloat = 535
            static let iPhoneMini: CGFloat = 516
            static let iPhoneProMax: CGFloat = 603
        }
    }
    
    enum AlertType {
        case littleValue
        case biggerValue
        case notShow
    }
    
    enum SaveButtonState {
        case turnOff
        case turnOn
    }
    
    enum Device: CGFloat {
        case iPhoneSE = 667
        case iPhone12 = 844
        case iPhoneMini = 812
        case iPhoneProMax = 926
        case otherDevice
    }
}
