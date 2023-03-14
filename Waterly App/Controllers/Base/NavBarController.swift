//
//  NavBarController.swift
//  Waterly App
//
//  Created by Olegio on 26.12.2022.
//

import UIKit

final class NavBarController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        view.backgroundColor = Resources.Colors.Back.backMain
    }
}
