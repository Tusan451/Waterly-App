//
//  BaseTextFieldViewModel.swift
//  Waterly App
//
//  Created by Olegio on 18.01.2023.
//

import Foundation

protocol BaseTextFieldViewModelProtocol: AnyObject {
    var text: String? { get set }
    var textDidChange: ((BaseTextFieldViewModelProtocol) -> (Void))? { get set }
    var placeholder: String? { get set }
    var valueText: String? { get set }
    init(text: String?, placeholder: String?, valueText: String?)
    func changeText(newValue: String?)
    func changePlaceholder(newValue: String?)
}

class BaseTextFieldViewModel: BaseTextFieldViewModelProtocol {
    
    var text: String? {
        didSet {
            textDidChange?(self)
        }
    }
    
    var textDidChange: ((BaseTextFieldViewModelProtocol) -> (Void))?
    
    var placeholder: String? {
        didSet {
            textDidChange?(self)
        }
    }
    
    var valueText: String?
    
    required init(text: String?, placeholder: String?, valueText: String?) {
        self.text = text
        self.placeholder = placeholder
        self.valueText = valueText
    }
    
    func changeText(newValue: String?) {
        self.text = newValue
    }
    
    func changePlaceholder(newValue: String?) {
        self.placeholder = newValue
    }
}
