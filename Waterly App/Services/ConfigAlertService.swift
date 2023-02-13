//
//  ConfigAlertService.swift
//  Waterly App
//
//  Created by Olegio on 08.02.2023.
//

import UIKit

protocol ConfigAlertServiceProtocol {
    func configureAlert(title: String,
                        message: String?,
                        actionTitle: String,
                        completion: @escaping (UIAlertAction) -> Void) -> UIAlertController
}

class ConfigAlertService: ConfigAlertServiceProtocol {
    static let shared = ConfigAlertService()
    
    func configureAlert(title: String,
                        message: String?,
                        actionTitle: String,
                        completion: @escaping (UIAlertAction) -> Void) -> UIAlertController {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: .default, handler: completion)
        alertController.addAction(action)
        
        return alertController
    }
}
