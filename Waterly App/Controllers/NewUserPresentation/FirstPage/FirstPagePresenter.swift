//
//  FirstPagePresenter.swift
//  Waterly App
//
//  Created by Olegio on 25.01.2023.
//

import Foundation

protocol FirstPageViewProtocol: AnyObject {
    func getIcon(name: String)
    func getMainTitle(text: String)
    func getSecondaryTitle(text: String)
    func getAuthorTitle(text: String)
}

protocol FirstPagePresenterProtocol {
    var iconName: String { get }
    var mainTitle: String { get }
    var secondaryTitle: String { get }
    var authorTitle: String { get }
    init(view: FirstPageViewProtocol)
    func setIcon()
    func setMainTitle()
    func setSecondaryTitle()
    func setAuthorTitle()
}

class FirstPagePresenter: FirstPagePresenterProtocol {
    
    weak var view: FirstPageViewProtocol?
    
    var iconName: String {
        Resources.Strings.NewUserPageVC.icon
    }
    
    var mainTitle: String {
        Resources.Strings.NewUserPageVC.mainTitle
    }
    
    var secondaryTitle: String {
        Resources.Strings.NewUserPageVC.secondaryTitle
    }
    
    var authorTitle: String {
        Resources.Strings.NewUserPageVC.author
    }
    
    required init(view: FirstPageViewProtocol) {
        self.view = view
    }
    
    func setIcon() {
        self.view?.getIcon(name: self.iconName)
    }
    
    func setMainTitle() {
        self.view?.getMainTitle(text: self.mainTitle)
    }
    
    func setSecondaryTitle() {
        self.view?.getSecondaryTitle(text: self.secondaryTitle)
    }
    
    func setAuthorTitle() {
        self.view?.getAuthorTitle(text: self.authorTitle)
    }
}
