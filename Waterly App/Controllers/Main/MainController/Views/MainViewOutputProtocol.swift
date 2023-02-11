//
//  MainViewOutputProtocol.swift
//  Waterly App
//
//  Created by Olegio on 09.02.2023.
//

import Foundation

protocol MainViewOutputProtocol {
    init(_ view: MainViewInputProtocol)
    func provideNavigationBarLabels()
    func provideDashboardInfoValues()
}
