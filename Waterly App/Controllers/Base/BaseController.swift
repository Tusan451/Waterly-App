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

//extension BaseController {
//
//    func setLeftAlignForTitle(text: String, font: UIFont, textColor: UIColor?) {
//
//        guard let navFrame = navigationController?.navigationBar.frame else { return }
//
//        let parentView = UIView(
//            frame: CGRect(x: 0,
//                          y: 0,
//                          width: navFrame.width,
//                          height: navFrame.height)
//        )
//
//        navigationItem.titleView = parentView
//
//        let titleLabel = UILabel(
//            frame: CGRect(x: parentView.frame.minX,
//                          y: parentView.frame.minY,
//                          width: parentView.frame.width,
//                          height: parentView.frame.height)
//        )
//
//        titleLabel.font = font
//        titleLabel.textAlignment = .left
//        titleLabel.textColor = textColor
//        titleLabel.text = text
//
//        parentView.addSubview(titleLabel)
//    }
//}
