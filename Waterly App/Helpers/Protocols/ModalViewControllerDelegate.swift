//
//  ModalViewControllerDelegate.swift
//  Waterly App
//
//  Created by Olegio on 13.01.2023.
//

import Foundation

protocol ModalViewControllerDelegate: AnyObject {
    func modalControllerWillDisapear(_ modal: BaseController)
}
