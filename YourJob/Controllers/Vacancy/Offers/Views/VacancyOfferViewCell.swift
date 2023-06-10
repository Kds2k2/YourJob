//
//  VacancyOfferViewCell.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 10.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import UIKit

class VacancyOfferViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var model: VacancyOfferViewModel? {
        didSet{
            configure()
        }
    }
    
    var effectView: BackgroundView = {
        let view = BackgroundView()
        view.imageView.image = nil
        view.effectView.effect = nil
        view.backgroundColor = .clear
        return view
    }()
    
    var stackView: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = .clear
        view.axis = .vertical
        view.distribution = .fill
        view.alignment = .fill
        view.isLayoutMarginsRelativeArrangement = true
        view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        view.spacing = 15
        return view
    }()
    
    var employerStackView: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = .clear
        view.axis = .horizontal
        view.distribution = .fill
        view.alignment = .fill
        view.spacing = 10
        return view
    }()
    
    var employerLogoStackView: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = .white
        view.axis = .vertical
        view.distribution = .fill
        view.alignment = .fill
        view.isLayoutMarginsRelativeArrangement = true
        view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    var employerTitleStackView: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = .clear
        view.axis = .vertical
        view.distribution = .fill
        view.alignment = .fill
        return view
    }()
    
    var employerLogoImageView: WebImageVIew = {
        let configuration = WebImageVIew.Configuration()
        let view = WebImageVIew(with: configuration)
        view.backgroundColor = .clear
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 24 * AppFont.scale).isActive = true
        view.heightAnchor.constraint(equalToConstant: 24 * AppFont.scale).isActive = true
        return view
    }()
    
    var employerTitleLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.lineBreakMode = .byWordWrapping
        view.numberOfLines = 0
        return view
    }()
    
    var publishedDateLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.numberOfLines = 1
        view.lineBreakMode = .byWordWrapping
        return view
    }()
    
    var vacancyStackView: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = .clear
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .fill
        view.spacing = 5
        return view
    }()
    
    var vacancyCategoryLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.numberOfLines = 1
        view.lineBreakMode = .byWordWrapping
        return view
    }()
    
    var vacancyTitleLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.numberOfLines = 1
        view.lineBreakMode = .byWordWrapping
        return view
    }()
    
    var vacancyDescriptionLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.numberOfLines = 2
        view.lineBreakMode = .byTruncatingTail
        return view
    }()
    
    var vacancySalaryLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.numberOfLines = 1
        view.lineBreakMode = .byWordWrapping
        return view
    }()
    
    private func setup() {
        backgroundColor = .clear
        contentView.backgroundColor = .secondarySystemBackground
        selectedBackgroundView = UIView()
        selectedBackgroundView!.backgroundColor = .clear
        layer.borderColor = UIColor.separator.cgColor
        layer.borderWidth = 0.5
        layer.cornerRadius = 5
        layer.masksToBounds = true
        
        contentView.addSubview(effectView)
        effectView.translatesAutoresizingMaskIntoConstraints = false
        effectView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        effectView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        effectView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        effectView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        
        stackView.addArrangedSubview(employerStackView)
        stackView.addArrangedSubview(vacancyStackView)
        
        employerStackView.addArrangedSubview(employerLogoStackView)
        employerStackView.addArrangedSubview(employerTitleStackView)
        
        employerLogoStackView.addArrangedSubview(employerLogoImageView)
        employerLogoStackView.addArrangedSubview(UIView())
        
        employerTitleStackView.addArrangedSubview(employerTitleLabel)
        employerTitleStackView.addArrangedSubview(publishedDateLabel)
        employerTitleStackView.addArrangedSubview(UIView())
        
        vacancyStackView.addArrangedSubview(vacancyCategoryLabel)
        vacancyStackView.addArrangedSubview(vacancyTitleLabel)
        vacancyStackView.addArrangedSubview(vacancyDescriptionLabel)
        vacancyStackView.addArrangedSubview(vacancySalaryLabel)
    }
    
    private func configure() {
        if let model = model {
            if let employerLogoUrl = model.employerLogoUrl {
                employerLogoImageView.load(from: employerLogoUrl)
            } else {
                employerLogoImageView.image = nil
            }
            
            employerTitleLabel.attributedText = model.attributedEmployerTitle
            publishedDateLabel.attributedText = model.attributedPublishedDate
            vacancyCategoryLabel.attributedText = model.attributedVacancyCategory
            vacancyTitleLabel.attributedText = model.attributedVacancyTitle
            vacancyDescriptionLabel.attributedText = model.attributedVacancyDescription
            vacancySalaryLabel.attributedText = model.attributedVacancySalary
        } else {
            reset()
        }
        
        employerLogoImageView.isHidden = (model?.employerLogoUrl == nil)
        employerTitleLabel.isHidden = (model?.attributedEmployerTitle == nil)
        publishedDateLabel.isHidden = (model?.attributedPublishedDate == nil)
        vacancyCategoryLabel.isHidden = (model?.attributedVacancyCategory == nil)
        vacancyTitleLabel.isHidden = (model?.attributedVacancyTitle == nil)
        vacancyDescriptionLabel.isHidden = (model?.attributedVacancyDescription == nil)
        vacancySalaryLabel.isHidden = (model?.attributedVacancySalary == nil)
    }
    
    private func reset() {
        employerLogoImageView.image = nil
        employerTitleLabel.text = nil
        publishedDateLabel.text = nil
        vacancyCategoryLabel.text = nil
        vacancyTitleLabel.text = nil
        vacancyDescriptionLabel.text = nil
        vacancySalaryLabel.text = nil
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        configure()
    }
}
