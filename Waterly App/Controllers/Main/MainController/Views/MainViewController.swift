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
        presenter.editButtonDidPressed()
    }
    
    func addWaterButtonDidPressed() {
        presenter.addWaterButtonDidPressed()
    }
}

extension MainViewController {
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        presenter.provideDashboardInfoValues()
        presenter.provideNavigationBarLabels()
        presenter.provideWaterGoalValue()
        presenter.provideWaterProgress()
        presenter.provideWaterHistoryValues()
        presenter.provideWeeklySummary()
    }
    
    override func configureViews() {
        super.configureViews()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        presenter.provideGoalViewDefault()
        presenter.provideWaterHistoryTitle()
        presenter.provideWeeklySummaryTitle()
        presenter.provideWeeklyStatisticDefault()
    }
}

extension MainViewController: ModalViewControllerDelegate {
    
    func modalControllerWillDisapear(_ modal: BaseController) {
        presenter.provideWaterGoalValue()
        presenter.provideWaterProgress()
        presenter.provideWaterHistoryValues()
    }
}

private extension MainViewController {
    
    func startPresentation() {
        let pageViewController = ModuleBuilder.configureNewUserPageModule(0)
        present(pageViewController, animated: true)
    }
}

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
    
    func setGoalViewDefaults(title: String, image: String) {
        mainView.counterView.goalView.titleLabel.text = title
        mainView.counterView.goalView.iconView.image =
        UIImage(named: image)?.withRenderingMode(.alwaysTemplate)
    }
    
    func setWaterGoalValue(value: String) {
        mainView.counterView.goalView.setValueLabel(with: value)
    }
    
    func setWaterProgress(progress: Double, goal: Double, percent: CGFloat) {
        mainView.counterView.configure(goal: goal, progress: progress, percent: percent)
    }
    
    func setWaterHistoryTitle(title: String) {
        mainView.waterHistoryView.titleLabel.text = title
    }
    
    func setWaterCapacity(capacity: [WaterCapacity]) {
        mainView.waterHistoryView.configure(items: capacity)
    }
    
    func setWeeklySummaryTitle(title: String) {
        mainView.weeklySummaryView.titleLabel.text = title
    }
    
    func setWeeklySummary(summary: [WeekWaterStatistic]) {
        print("Weekly Summary: \(summary)")
        mainView.weeklySummaryView.configure(items: summary, size: .short, type: .week)
    }
    
    func setAverageDefault(title: String, imageName: String, type: ActivityType) {
        mainView.weeklySummaryView.statisticsView.averageDrinkedView.titleLabel.text = title
        mainView.weeklySummaryView.statisticsView.averageDrinkedView.iconView.image =
        UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
        mainView.weeklySummaryView.statisticsView.averageDrinkedView.setIconColor(for: type)
    }
    
    func setGoalsDefault(title: String, imageName: String, type: ActivityType) {
        mainView.weeklySummaryView.statisticsView.hitGoalsView.titleLabel.text = title
        mainView.weeklySummaryView.statisticsView.hitGoalsView.iconView.image =
        UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
        mainView.weeklySummaryView.statisticsView.hitGoalsView.setIconColor(for: type)
    }
}
