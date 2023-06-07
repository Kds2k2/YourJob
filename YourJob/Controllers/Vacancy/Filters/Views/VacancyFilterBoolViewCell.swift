//
//  VacancyFilterBoolViewCell.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 07.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import UIKit

class VacancyFilterBoolViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var model: VacancyFilterBoolViewModel? {
        didSet{
            configure()
        }
    }
    
    var stackView: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = .clear
        view.distribution = .fill
        view.alignment = .fill
        view.axis = .horizontal
        view.spacing = 0
        return view
    }()
    
    var titleLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.numberOfLines = 1
        view.lineBreakMode = .byWordWrapping
        view.font = AppFont.Cell.title
        view.textColor = AppColor.Cell.text
        return view
    }()
    
    lazy var valueControll: UISegmentedControl = {
        let states = [AppString.State.notSet.localized(),
                      AppString.State.no.localized(),
                      AppString.State.yes.localized()]
        let view = UISegmentedControl(items: states)
        view.selectedSegmentIndex = 0
        view.setTitleTextAttributes([.font: AppFont.Cell.text, .foregroundColor: AppColor.Cell.text], for: .normal)
        view.setTitleTextAttributes([.font: AppFont.Cell.title, .foregroundColor: UIColor.white], for: .selected)
        view.selectedSegmentTintColor = .systemBlue
        view.addTarget(self, action: #selector(valueChanged(_ : )), for: .valueChanged)
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
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(valueControll)
    }
    
    @objc private func valueChanged(_ sender: UISegmentedControl) {
        guard let model = model else { return }
        switch sender.selectedSegmentIndex {
        case 1: model.value = false
        case 2: model.value = true
        default:
            model.value = nil
        }
    }
    
    private func configure() {
        if let model = model {
            titleLabel.text = model.title
            if let value = model.value {
                valueControll.selectedSegmentIndex = value ? 2 : 1
            } else {
                valueControll.selectedSegmentIndex = 0
            }
        } else {
            reset()
        }
    }
    
    private func reset() {
        valueControll.selectedSegmentIndex = 0
        titleLabel.text = nil
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        configure()
    }
}
