//
//  VacancyFilterStringViewCell.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 07.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import UIKit

class VacancyFilterStringViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var model: VacancyFilterStringViewModel? {
        didSet{
            configure()
        }
    }
    
    lazy var inputField: UITextField = {
        var field = UITextField()
        field.backgroundColor = .clear
        field.borderStyle = .none
        field.clearButtonMode = .always
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .default
        field.enablesReturnKeyAutomatically = false
        field.font = AppFont.Input.text
        field.textColor = AppColor.Input.text
        field.addTarget(self, action: #selector(valueChanged(_ : )), for: .editingChanged)
        field.delegate = self
        return field
    }()
    
    private func setup() {
        selectionStyle = .none
        accessoryType = .none
        
        contentView.addSubview(inputField)
        inputField.translatesAutoresizingMaskIntoConstraints = false
        inputField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        inputField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
        inputField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        inputField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
    }
    
    private func configure() {
        if let model = model {
            inputField.text = model.value
            inputField.textContentType = model.contentType
            let placeholder = (model.placeholder ?? AppString.Input.Placeholder.common).localized()
            inputField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [
                .font: AppFont.Input.placeholder,
                .foregroundColor: AppColor.Input.placeholder
            ])
        } else {
            reset()
        }
    }
    
    private func reset() {
        inputField.text = nil
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        configure()
    }
    
    @objc private func valueChanged(_ sender: UITextField) {
        guard let model = model else { return }
        model.value = sender.text
    }
}

//MARK: UITextFieldDelegate
extension VacancyFilterStringViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
