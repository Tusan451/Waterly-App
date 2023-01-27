//
//  ScreenPagePresenter.swift
//  Waterly App
//
//  Created by Olegio on 26.01.2023.
//

import Foundation

protocol ScreenPageViewProtocol: AnyObject {
    func setContent(title: String, imageName: String, message: String)
}

protocol ScreenPagePresenterProtocol: AnyObject {
    var title: String { get }
    var imageName: String { get }
    var message: String { get }
    init(view: ScreenPageViewProtocol, title: String, imageName: String, message: String)
    func configureContent()
}

class ScreenPagePresenter: ScreenPagePresenterProtocol {
    
    weak var view: ScreenPageViewProtocol?
    
    var title: String
    
    var imageName: String
    
    var message: String
    
    required init(view: ScreenPageViewProtocol, title: String, imageName: String, message: String) {
        self.view = view
        self.title = title
        self.imageName = imageName
        self.message = message
    }
    
    func configureContent() {
        self.view?.setContent(title: self.title,
                              imageName: self.imageName,
                              message: self.message)
    }
}
