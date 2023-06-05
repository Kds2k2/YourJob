//
//  BackgroundView.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 05.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import Foundation
import UIKit

class BackgroundView: UIView {
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.image = nil
        view.backgroundColor = .clear
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    lazy var effectView: UIVisualEffectView = {
        let view = UIVisualEffectView()
        view.backgroundColor = .clear
        view.effect = .none
        return view
    }()
    
    func setup() {
        self.backgroundColor = .clear
        self.clipsToBounds = true
        
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo:  self.topAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        self.addSubview(effectView)
        effectView.translatesAutoresizingMaskIntoConstraints = false
        effectView.topAnchor.constraint(equalTo:  self.topAnchor).isActive = true
        effectView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        effectView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        effectView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
