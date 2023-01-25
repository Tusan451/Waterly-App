//
//  AddWaterPresenterTest.swift
//  Waterly AppTests
//
//  Created by Olegio on 24.01.2023.
//

import XCTest
@testable import Waterly_App

struct MockModel {
    var recommendDailyValue: Int
    var dayGoal: Int
    var dayProgress: Int
    var recentlyAddedWater: [RecentlyAddedWater]
}

class MockView: AddWaterViewProtocol {
    
    // MARK: - Variables
    var mainTitleTest: String?
    var textFieldTitleTest: String?
    var textFieldPlaceholderTest: String?
    var textFieldValuePlaceholderTest: String?
    
    // MARK: - Methods
    
    func setMainTitle(title: String) {
        self.mainTitleTest = title
    }
    
    func setTextFieldTextValues(title: String, placeholder: String, valuePlaceholder: String) {
        self.textFieldTitleTest = title
        self.textFieldPlaceholderTest = placeholder
        self.textFieldValuePlaceholderTest = valuePlaceholder
    }
    
    func setDismissButtonTitle(title: String) {
        ///
    }
    
    func setActionButtonTitle(title: String) {
        ///
    }
    
    func setDailyPercentViewTitle(title: String) {
        ///
    }
    
    func setDailyPercentViewValue(value: String, state: Waterly_App.DailyPercentValueState) {
        ///
    }
    
    func setCurrentProgressViewTitle(title: String) {
        ///
    }
    
    func setCurrentProgressViewValue(value: String) {
        ///
    }
    
    func setCurrentProgressViewValueFor(newValue: String?, arrowState: Waterly_App.ArrowState) {
        ///
    }
    
    func setSaveButtonState(state: Waterly_App.Resources.SaveButtonState) {
        ///
    }
    
    func showAlert(title: String, message: String, okButtonTitle: String) {
        ///
    }
    
    func dismiss() {
        ///
    }
    
    func clearTextFieldText(placeholder: String?) {
        ///
    }
    
    
}

final class AddWaterPresenterTest: XCTestCase {
    
    var view: MockView!
    var model: MockModel!
    var presenter: AddWaterPresenter!

    override func setUpWithError() throws {
        view = MockView()
        model = MockModel(
            recommendDailyValue: 2000,
            dayGoal: 2500,
            dayProgress: 0,
            recentlyAddedWater: []
        )
        presenter = AddWaterPresenter(view: view)
    }

    override func tearDownWithError() throws {
        view = nil
        model = nil
        presenter = nil
    }

    func testModuleIsNotNil() {
        XCTAssertNotNil(view, "view is not nil")
        XCTAssertNotNil(model, "model is not nil")
        XCTAssertNotNil(presenter, "presenter is not nil")
    }
    
    func testMainTitle() {
        presenter.setViewTitle()
        XCTAssertEqual(view.mainTitleTest, Resources.Strings.MainController.AddWaterController.header)
    }
}
