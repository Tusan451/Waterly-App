//
//  BaseController.swift
//  Waterly App
//
//  Created by Olegio on 26.12.2022.
//

import UIKit

class BaseController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        layoutViews()
        configureViews()
    }
}

@objc extension BaseController {
    
    func addViews() {}
    
    func layoutViews() {}
    
    func configureViews() {
        view.backgroundColor = Resources.Colors.Back.backMain
    }
}
