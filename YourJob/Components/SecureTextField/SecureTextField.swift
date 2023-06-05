//
//  SecureTextField.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 05.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import Foundation
import UIKit

class SecureTextField: UITextField {
    
    public var isSecureTextToggleEnabled: Bool = false {
        didSet{
            if isSecureTextToggleEnabled {
                rightView = secureTextButton
                rightViewMode = .always
            } else {
                rightView = nil
                rightViewMode = .never
            }
            
            updateSecureImage()
        }
    }
    
    override var tintColor: UIColor! {
        didSet{
            secureTextButton.tintColor = tintColor
        }
    }
    
    private struct Secure {
        static let normal = UIImage(systemName: "eye.fill")?.withTintColor(.systemBlue, renderingMode: .alwaysTemplate)
        static let slash = UIImage(systemName: "eye.slash.fill")?.withTintColor(.systemBlue, renderingMode: .alwaysTemplate)
    }
    
    private lazy var secureTextButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.tintColor = .separator
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 24).isActive = true
        button.widthAnchor.constraint(equalToConstant: 32).isActive = true
        button.addTarget(self, action: #selector(toggleSecureTextView), for: .touchUpInside)
        return button
    }()
    
    private func updateSecureImage() {
        if isSecureTextEntry {
            secureTextButton.setImage(Secure.normal, for: .normal)
        } else {
            secureTextButton.setImage(Secure.slash, for: .normal)
        }
    }
    
    @objc private func toggleSecureTextView() {
        isSecureTextEntry.toggle()
        updateSecureImage()
    }
}
