//
//  TestViewController.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 04.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    var imageView: UIImageView = {
       let view = UIImageView()
        view.image = UIImage(named: "logo.png")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    var titleLabel: UILabel = {
        let view = UILabel()
        view.text = AppString.View.Welcome.title.localized()
        view.textAlignment = .center
        view.textColor = AppColor.View.title
        view.font = AppFont.View.title
        view.numberOfLines = 1
        return view
    }()
    
    var descriptionLabel: UILabel = {
        let view = UILabel()
        view.text = AppString.View.Welcome.description
        view.textColor = AppColor.View.description
        view.textAlignment = .center
        view.font = AppFont.View.description
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = AppColor.View.background
        
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40).isActive = true
        
        view.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: AppInfo.isIpad ? 150 : 30).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: AppInfo.isIpad ? -150 : -30).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        
    }
}
