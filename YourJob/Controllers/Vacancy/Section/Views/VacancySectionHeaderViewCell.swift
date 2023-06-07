//
//  VacancySectionHeaderViewCell.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 06.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import UIKit

class VacancySectionHeaderViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var model: VacancySectionHeaderViewModel? {
        didSet{
            configure()
        }
    }
    
    var headerLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        return view
    }()
    
    lazy var separatorView: UIView = {
        let view = DashedLineView()
        view.style = .horizontal
        view.lineColor = .secondaryLabel.withAlphaComponent(0.6)
        view.dashPattern = [1, 3]
        view.backgroundColor = .clear
        return view
    }()
    
    private func setup() {
        selectionStyle = .none
        accessoryType = .none
        
        contentView.addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        headerLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        headerLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        headerLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        
        contentView.addSubview(separatorView)
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        separatorView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        separatorView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 5).isActive = true
    }
    
    private func configure() {
        if let model = model {
            headerLabel.attributedText = model.attributedTitle
        } else {
            reset()
        }
    }
    
    private func reset() {
        headerLabel.text = nil
    }
    
    override func prepareForReuse() {
        configure()
    }
}
