//
//  YAxisView.swift
//  Waterly App
//
//  Created by Olegio on 10.01.2023.
//

import UIKit

final class YAxisView: BaseView {
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .equalSpacing
        return view
    }()
}

extension YAxisView {
    
    override func addViews() {
        super.addViews()
    }
    
    override func layoutViews() {
        super.layoutViews()
    }
    
    override func configureViews() {
        super.configureViews()
    }
}
