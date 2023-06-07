//
//  VacancyFilterEnumItemViewCell.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 07.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import UIKit

class VacancyFilterOptionViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var model: VacancyFIlterOptionViewModel? {
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
        view.isLayoutMarginsRelativeArrangement = true
        view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5)
        return view
    }()
    
    var valueLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.numberOfLines = 1
        view.lineBreakMode = .byWordWrapping
        view.font = AppFont.Cell.title
        view.textColor = AppColor.Cell.text
        return view
    }()
    
    lazy var valueSwitch: UISwitch = {
        var view = UISwitch()
        view.addTarget(self, action: #selector(valueChanged(_ : )), for: .valueChanged)
        view.onTintColor = AppColor.Cell.selection
        return view
    }()
    
    private func setup() {
        selectionStyle = .none
        accessoryType = .none

        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true

        stackView.addArrangedSubview(valueLabel)
        stackView.addArrangedSubview(UIView())
        stackView.addArrangedSubview(valueSwitch)
    }
    
    private func configure() {
        if let model = model {
            valueLabel.text = model.title
            valueSwitch.setOn(model.isSelected, animated: true)
        } else {
            reset()
        }
    }
    
    private func reset() {
        valueLabel.text = nil
        valueSwitch.setOn(false, animated: false)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        configure()
    }
    
    @objc private func valueChanged(_ sender: UISwitch) {
        guard let model = model else { return }
        model.isSelected = sender.isOn
    }
}

//MARK: UITextFieldDelegate
extension VacancyFilterOptionViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
