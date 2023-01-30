//
//  ScreenPageMainView.swift
//  Waterly App
//
//  Created by Olegio on 26.01.2023.
//

import UIKit

final class ScreenPageMainView: BaseView {
        
    let imageView = UIImageView()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProMedium(size: 28)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.sfProMedium(size: 16)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
}

extension ScreenPageMainView {
    
    override func addViews() {
        super.addViews()
        
        addView(titleLabel)
        addView(imageView)
        addView(messageLabel)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        let imageWidthAndHeightConstarintsArray = widthAndHeightConstraintsForImage()
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            titleLabel.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -20),
            
            imageView.widthAnchor.constraint(equalToConstant: imageWidthAndHeightConstarintsArray[0]),
            imageView.heightAnchor.constraint(equalToConstant: imageWidthAndHeightConstarintsArray[1]),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            imageView.bottomAnchor.constraint(equalTo: messageLabel.topAnchor),
            
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            messageLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
}

private extension ScreenPageMainView {
    
    func widthAndHeightConstraintsForImage() -> [CGFloat] {
        let device = deviceDetection()
        
        var imageWidthConstant: CGFloat
        var imageHeightConstant: CGFloat
        
        switch device {
        case .iPhoneSE:
            imageWidthConstant = Resources.Values.PageVCScreenWidth.iPhoneSE
            imageHeightConstant = Resources.Values.PageVCScreenHeight.iPhoneSE
        case .iPhone12:
            imageWidthConstant = Resources.Values.PageVCScreenWidth.iPhone12
            imageHeightConstant = Resources.Values.PageVCScreenHeight.iPhone12
        case .iPhoneMini:
            imageWidthConstant = Resources.Values.PageVCScreenWidth.iPhoneMini
            imageHeightConstant = Resources.Values.PageVCScreenHeight.iPhoneMini
        case .iPhoneProMax:
            imageWidthConstant = Resources.Values.PageVCScreenWidth.iPhoneProMax
            imageHeightConstant = Resources.Values.PageVCScreenHeight.iPhoneProMax
        case .otherDevice:
            imageWidthConstant = Resources.Values.PageVCScreenWidth.iPhone12
            imageHeightConstant = Resources.Values.PageVCScreenHeight.iPhone12
        }
        
        return [imageWidthConstant, imageHeightConstant]
    }
    
    func deviceDetection() -> Resources.Device {
        let screenHeight = UIScreen.main.bounds.height
        var device: Resources.Device = .otherDevice
        
        switch screenHeight {
        case let x where x == Resources.Device.iPhoneSE.rawValue:
            device = .iPhoneSE
        case let x where x == Resources.Device.iPhone12.rawValue:
            device = .iPhone12
        case let x where x == Resources.Device.iPhoneMini.rawValue:
            device = .iPhoneMini
        case let x where x == Resources.Device.iPhoneProMax.rawValue:
            device = .iPhoneProMax
        default:
            device = .otherDevice
        }
        
        return device
    }
}
