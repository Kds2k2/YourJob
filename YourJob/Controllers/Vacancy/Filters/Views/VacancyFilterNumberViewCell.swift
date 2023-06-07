//
//  VacancyFilterNumberViewCell.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 07.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import UIKit

class VacancyFilterNumberViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var model: VacancyFilterNumberViewModel? {
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
        view.spacing = 10
        return view
    }()
    
    var valueLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.numberOfLines = 1
        view.lineBreakMode = .byWordWrapping
        view.font = AppFont.Cell.title
        view.textColor = AppColor.Cell.text
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 100).isActive = true
        return view
    }()
    
    lazy var valueSlider: UISlider = {
        var view = UISlider()
        view.minimumValue = 0
        view.maximumValue = 100
        view.addTarget(self, action: #selector(valueChanged(_ : )), for: .valueChanged)
        view.tintColor = AppColor.Cell.selection
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

        stackView.addArrangedSubview(valueLabel)
        stackView.addArrangedSubview(valueSlider)
    }
    
    private func configure() {
        if let model = model {
            if let value = model.value {
                valueSlider.value = Float(value) / 1000
                var string = String(format: model.format, arguments: [value])
                valueLabel.attributedText = NSAttributedString(string: string, attributes: [.font: AppFont.Cell.title, .foregroundColor: AppColor.Cell.text])
            } else {
                valueSlider.value = valueSlider.minimumValue
                valueLabel.attributedText = NSAttributedString(string: AppString.State.notSet, attributes: [.font: AppFont.Cell.text, .foregroundColor: AppColor.Cell.header])
            }
        } else {
            reset()
        }
    }
    
    private func reset() {
        valueSlider.value = valueSlider.minimumValue
        valueLabel.text = nil
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        configure()
    }
    
    @objc private func valueChanged(_ sender: UISlider) {
        guard let model = model else { return }
        if sender.value > sender.minimumValue {
            model.value = Int(sender.value) * 1000
        } else {
            model.value = nil
        }
        configure()
    }
}

//MARK: UITextFieldDelegate
extension VacancyFilterNumberViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
