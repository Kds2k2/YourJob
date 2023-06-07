//
//  VacancyEmployerViewCell.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 07.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import UIKit

class VacancyEmployerViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var model: VacancyEmployerViewModel? {
        didSet{
            configure()
        }
    }
    
    var stackView: UIStackView = {
        var view = UIStackView()
        view.backgroundColor = .clear
        view.distribution = .fill
        view.alignment = .fill
        view.axis = .vertical
        view.spacing = 10
        return view
    }()
    
    var headerStackView: UIStackView = {
        var view = UIStackView()
        view.backgroundColor = .clear
        view.axis = .horizontal
        view.distribution = .fill
        view.alignment = .fill
        view.spacing = 10
        return view
    }()
    
    var titleStackView: UIStackView = {
        var view = UIStackView()
        view.backgroundColor = .clear
        view.axis = .vertical
        view.spacing = 0
        view.distribution = .fill
        view.alignment = .fill
        return view
    }()
    
    var logoStackView: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = .white
        view.distribution = .fill
        view.alignment = .fill
        view.axis = .horizontal
        view.spacing = 0
        view.isLayoutMarginsRelativeArrangement = true
        view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        view.layer.cornerRadius = 3
        view.layer.masksToBounds = true
        return view
    }()
    
    var logoImageView: WebImageVIew = {
        let configuration = WebImageVIew.Configuration()
        let view = WebImageVIew(with: configuration)
        view.backgroundColor = .clear
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 44).isActive = true
        view.heightAnchor.constraint(equalToConstant: 44).isActive = true
        view.image = AppImage.BackGround.lightBlue
        return view
    }()
    
    var titleLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        return view
    }()
    
    var emailLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        return view
    }()
    
    var phoneLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        return view
    }()
    
    var descriptionLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        return view
    }()
    
    private func setup() {
        selectionStyle = .none
        accessoryType = .none
        
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        
        stackView.addArrangedSubview(headerStackView)
        stackView.addArrangedSubview(descriptionLabel)
        
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(emailLabel)
        titleStackView.addArrangedSubview(phoneLabel)
        titleStackView.addArrangedSubview(UIView())
        
        logoStackView.addArrangedSubview(logoImageView)
        
        headerStackView.addArrangedSubview(logoStackView)
        headerStackView.addArrangedSubview(titleStackView)
    }
    
    private func configure() {
        if let model = model {
            if let logoUrl = model.logoUrl {
                logoImageView.load(from: logoUrl)
            }
            titleLabel.attributedText = model.attributedTitle
            emailLabel.attributedText = model.attributedEmail
            phoneLabel.attributedText = model.attributedPhone
            descriptionLabel.attributedText = model.attributedDescription
        } else {
            reset()
        }
        
        titleLabel.isHidden = (titleLabel.text == nil)
        emailLabel.isHidden = (emailLabel.text == nil)
        phoneLabel.isHidden = (phoneLabel.text == nil)
        descriptionLabel.isHidden = (descriptionLabel.text == nil)
    }
    
    private func reset() {
        titleLabel.text = nil
        emailLabel.text = nil
        phoneLabel.text = nil
        descriptionLabel.text = nil
    }
    
    override func prepareForReuse() {
        configure()
    }
}
