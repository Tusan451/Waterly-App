//
//  MainViewController.swift
//  Waterly App
//
//  Created by Olegio on 26.12.2022.
//

import UIKit

final class MainViewController: BaseController {
    
    var mainView = MainView()
    var presenter: MainViewOutputProtocol!
}

extension MainViewController: MainViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.delegate = self
    }
    
    func editButtonDidPressed() {
        print("editButtonDidPressed")
    }
    
    func addWaterButtonDidPressed() {
        print("addWaterButtonDidPressed")
    }
}

extension MainViewController {
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

//        startPresentation()
        presenter.provideDashboardInfoValues()
    }
    
    override func configureViews() {
        super.configureViews()
        
//        navigationBarConfigure()
        navigationController?.navigationBar.prefersLargeTitles = true
        presenter.provideNavigationBarLabels()
    }
}

//extension MainViewController: ModalViewControllerDelegate {
//    
//    func modalControllerWillDisapear(_ modal: BaseController) {
//        
//        counterView.configure(goal: Double(dayGoal), progress: Double(dayProgress))
//        counterView.configureDailyGoalValue(dayGoal)
//        
//        waterHistoryView.configure(items: recentlyAddedWater)
//    }
//}

private extension MainViewController {
    
//    func navigationBarConfigure() {
//        title = "Привет, Олег!"
//        navigationController?.tabBarItem.title = Resources.Strings.TabBar.main
//        navigationController?.navigationBar.prefersLargeTitles = true
//    }
    
    func startPresentation() {
        let pageViewController = ModuleBuilder.configureNewUserPageModule(0)
        present(pageViewController, animated: true)
    }
}

//@objc extension MainViewController {
//    
//    // MARK: - Вызов поп-ап окна с изменением дневной нормы
//    func editButtonTapped() {
//        let addDayGoalVc = ModuleBuilder.configureAddDayGoalModule(self)
//        self.present(addDayGoalVc, animated: true)
//    }
//    
//    // MARK: - Добавление выпитой воды
//    func addWaterButtonTapped() {
//        let addWaterVc = ModuleBuilder.configureAddWaterModule(self)
//        self.present(addWaterVc, animated: true)
//    }
//}

// MARK: - MainViewInputProtocol

extension MainViewController: MainViewInputProtocol {
    
    func setNavigationBarTitle(navBarTitle: String) {
        self.navigationItem.title = navBarTitle
    }

    func setMainTitle(title: String) {
        navigationController?.tabBarItem.title = title
    }
    
    func setDailyWaterView(title: String, image: String, value: String) {
        mainView.dashboardInfoView.dailyWaterGoalView.titleLabel.text = title
        mainView.dashboardInfoView.dailyWaterGoalView.iconView.image =
        UIImage(named: image)?.withRenderingMode(.alwaysTemplate)
        mainView.dashboardInfoView.configureDailyValue(
            recommendDailyValue: value
        )
    }
    
    func setActivityView(title: String, image: String, activityType: ActivityType) {
        mainView.dashboardInfoView.activityModeView.titleLabel.text = title
        mainView.dashboardInfoView.activityModeView.iconView.image =
        UIImage(named: image)?.withRenderingMode(.alwaysTemplate)
        mainView.dashboardInfoView.configureactivityType(
            activityType: activityType
        )
    }
}
