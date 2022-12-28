//
//  UIView + ext.swift
//  Waterly App
//
//  Created by Olegio on 27.12.2022.
//

import UIKit

extension UIView {
    
    func addView(_ view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
