//
//  UIViewController+Alert.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 05.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func presentInfo(title: String? = nil, message: String, actions: [UIAlertAction]? = nil) {
        presentAlert(image: AppImage.Alert.Info.normal, title: title != nil ? title : AppString.Alert.info, message: message, actions: actions)
    }
    
    func presentError(title: String? = nil, message: String, actions: [UIAlertAction]? = nil) {
        presentAlert(image: AppImage.Alert.Error.normal, title: title != nil ? title : AppString.Alert.error, message: message, actions: actions)
    }
    
    func presentQuestion(title: String? = nil, message: String, actions: [UIAlertAction]? = nil) {
        presentAlert(image: AppImage.Alert.Question.normal, title: title != nil ? title : AppString.Alert.question, message: message, actions: actions)
    }
    
    func presentWarning(title: String? = nil, message: String, actions: [UIAlertAction]? = nil) {
        presentAlert(image: AppImage.Alert.Warning.normal, title: title != nil ? title : AppString.Alert.warning, message: message, actions: actions)
    }
    
    func presentConfirmation(title: String? = nil, message: String, actions: [UIAlertAction]? = nil) {
        presentAlert(image: AppImage.Alert.Info.normal, title: title != nil ? title : AppString.Alert.confirm, message: message, actions: actions)
    }
    
    func presentSuccess(title: String? = nil, message: String, actions: [UIAlertAction]? = nil) {
        presentAlert(image: AppImage.Alert.Success.normal, title: title != nil ? title : AppString.Alert.success, message: message, actions: actions)
    }
    
    func presentFailure(title: String? = nil, message: String, actions: [UIAlertAction]? = nil) {
        presentAlert(image: AppImage.Alert.Failure.normal, title: title != nil ? title : AppString.Alert.failure, message: message, actions: actions)
    }
    
    func presentAlert(image: UIImage? = nil, title: String? = nil, message: String? = nil, style: UIAlertController.Style = .alert, actions: [UIAlertAction]? = nil) {
        var imageAttachment: NSTextAttachment? = nil
        var attrubutedTitle: NSAttributedString? = nil
        var attrubutedMessage: NSAttributedString? = nil
        
        if let image = image {
            imageAttachment = image.makeAttachment(maxPixelSize: Int(72 * AppFont.scale))
        }
        
        if let title = title {
            attrubutedTitle = NSAttributedString(string: title.localized(), attributes: [.font: AppFont.Alert.title])
        }
        
        if let message = message {
            attrubutedMessage = NSAttributedString(string: message.localized(), attributes: [.font: AppFont.Alert.message])
        }
        
        presentAlert(imageAttachment: imageAttachment, attrubutedTitle: attrubutedTitle, attrubutedMessage: attrubutedMessage, style: style, actions: actions)
    }
    
    func presentAlert(imageAttachment: NSTextAttachment? = nil, attrubutedTitle: NSAttributedString? = nil, attrubutedMessage: NSAttributedString? = nil, style: UIAlertController.Style = .alert, actions: [UIAlertAction]? = nil) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: nil, message: nil, preferredStyle: style)
            
            let titleAttributedString = NSMutableAttributedString()
            if let imageAttachment = imageAttachment {
                titleAttributedString.append(NSAttributedString(string: "\n"))
                titleAttributedString.append(NSMutableAttributedString(attachment: imageAttachment))
                titleAttributedString.append(NSAttributedString(string: "\n\n"))
            }
            
            if let attrubutedTitle = attrubutedTitle {
                titleAttributedString.append(attrubutedTitle)
            }
            
            alert.setValue(titleAttributedString, forKey: "attributedTitle")
            
            let messageAttributedString = NSMutableAttributedString()
            if let attrubutedMessage = attrubutedMessage {
                messageAttributedString.append(attrubutedMessage)
            }
            
            alert.setValue(messageAttributedString, forKey: "attributedMessage")
            
            if let actions = actions, actions.count > 0{
                actions.forEach({
                    alert.addAction($0)
                })
            } else {
                alert.addAction(UIAlertAction(title: AppString.Button.close.localized(), style: .default))
            }
            
            (self.navigationController ?? self).present(alert, animated: true)
        }
    }
}
