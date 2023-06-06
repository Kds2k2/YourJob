//
//  VacancyDetailsContentViewCell.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 06.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import UIKit

class VacancyDetailsContentViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var model: VacancyDetailsContentViewModel? {
        didSet{
            configure()
        }
    }
    
    var componentLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        return view
    }()
    
    private func setup() {
        selectionStyle = .none
        accessoryType = .none
        
        contentView.addSubview(componentLabel)
        componentLabel.translatesAutoresizingMaskIntoConstraints = false
        componentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        componentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        componentLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        componentLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
    }
    
    private func configure() {
        if let model = model {
            componentLabel.attributedText = model.attributedText
        } else {
            reset()
        }
    }
    
    private func reset() {
        componentLabel.text = nil
    }
    
    override func prepareForReuse() {
        configure()
    }
}
