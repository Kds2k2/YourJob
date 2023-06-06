//
//  SignUpCompleteViewController.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 05.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import UIKit

class SignUpCompleteViewController: UIViewController {

    var backgroundView: BackgroundView = {
        let view = BackgroundView()
        view.imageView.image = .none
        view.effectView.effect = .none
        view.backgroundColor = .clear
        return view
    }()
    
    var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .clear
        view.isScrollEnabled = true
        view.showsVerticalScrollIndicator = true
        view.showsHorizontalScrollIndicator = false
        view.bounces = true
        view.bouncesZoom = false
        view.alwaysBounceVertical = true
        view.alwaysBounceHorizontal = false
        view.clipsToBounds = false
        return view
    }()
    
    var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.clipsToBounds = true
        return view
    }()
    
    var logoImageView: UIImageView = {
       let view = UIImageView()
        view.image = AppImage.Logo.app
        view.contentMode = .scaleAspectFit
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: AppDelegate.self, action: #selector(AppDelegate.showAbout)))
        return view
    }()
    
    var titleLabel: UILabel = {
        let view = UILabel()
        view.text = AppString.View.SignUpConfirm.title
        view.textAlignment = .center
        view.textColor = AppColor.View.title
        view.font = AppFont.View.title
        view.numberOfLines = 1
        return view
    }()
    
    var descriptionLabel: UILabel = {
        let view = UILabel()
        view.text = AppString.View.SignUpConfirm.description
        view.textColor = AppColor.View.description
        view.textAlignment = .center
        view.font = AppFont.View.description
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        return view
    }()
    
    lazy var confirmationCodeInputField: UITextField = {
        let view = UITextField()
        view.backgroundColor = AppColor.Input.background
        view.borderStyle = .roundedRect
        view.clearButtonMode = .always
        view.textContentType = .oneTimeCode
        view.autocapitalizationType = .none
        view.autocorrectionType = .no
        view.returnKeyType = .default
        view.enablesReturnKeyAutomatically = true
        view.font = AppFont.Input.text
        view.attributedPlaceholder = NSAttributedString(string: AppString.Input.Placeholder.confrimationCode, attributes: [.font: AppFont.Input.placeholder, .foregroundColor: AppColor.Input.placeholder])
        view.textColor = AppColor.Input.text
        view.layer.cornerRadius = AppLayout.Input.cornerRadius
        view.layer.borderColor = AppColor.Input.border.cgColor
        view.layer.borderWidth = AppLayout.Input.borderWidth
        view.keyboardType = .numberPad
        view.inputAccessoryView = accessoryView
        view.delegate = self
        return view
    }()
    
    var accessoryView: UIView = {
        var view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 44))
        view.backgroundColor = .clear
        
        let backgroundView = BackgroundView()
        backgroundView.effectView.effect = UIBlurEffect(style: .regular)
        view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        var toolBar = UIToolbar()
        toolBar.backgroundColor = .clear
        view.addSubview(toolBar)
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        toolBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        toolBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        toolBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        toolBar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        var buttonItems = [UIBarButtonItem]()
        buttonItems.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil))
        buttonItems.append(UIBarButtonItem(image: AppImage.Return.right, style: .plain, target: self, action: #selector(completeCodeInput)))
        toolBar.items = buttonItems
        
        return view
    }()
    
    lazy var submitButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = AppColor.Button.Filled.background
        configuration.baseForegroundColor = AppColor.Button.Filled.foreground
        configuration.background.cornerRadius = AppLayout.Button.cornerRadius
        let view = UIButton(configuration: configuration)
        view.setAttributedTitle(NSAttributedString(string: AppString.Button.submit.localized().uppercased(), attributes: [.font: AppFont.Button.title]), for: .normal)
        view.addAction(UIAction(handler: { _ in self.submit() } ), for: .touchUpInside)
        return view
    }()
    
    var resendCodeLabel: UILabel = {
        let view = UILabel()
        view.text = AppString.View.ResetPassword.resendCode
        view.textColor = AppColor.View.description
        view.textAlignment = .center
        view.font = AppFont.View.description
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        return view
    }()

    lazy var resendCodeButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.baseBackgroundColor = AppColor.Button.Plaine.background
        configuration.baseForegroundColor = AppColor.Button.Plaine.foreground
        let view = UIButton(configuration: configuration)
        view.setAttributedTitle(NSAttributedString(string: AppString.Button.resendAgain.localized(), attributes: [.font: AppFont.Button.title]), for: .normal)
        view.addAction(UIAction(handler: { _ in self.resendCode() } ), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: AppImage.Chevron.left, style: .plain, target: self, action: #selector(cancel))
        
        view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 0).isActive = true
        contentView.leftAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leftAnchor, constant: 0).isActive = true
        contentView.rightAnchor.constraint(equalTo: scrollView.contentLayoutGuide.rightAnchor, constant: 0).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: 0).isActive = true
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 0).isActive = true
        contentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor, constant: 0).isActive = true
        
        contentView.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: AppLayout.View.left).isActive = true
        logoImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: AppLayout.View.right).isActive = true
        logoImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -220).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: AppLayout.Logo.height).isActive = true
        
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: AppLayout.View.left).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: AppLayout.View.right).isActive = true
        titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 40).isActive = true
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: AppLayout.View.left).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: AppLayout.View.right).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        
        contentView.addSubview(confirmationCodeInputField)
        confirmationCodeInputField.translatesAutoresizingMaskIntoConstraints = false
        confirmationCodeInputField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40).isActive = true
        confirmationCodeInputField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: AppLayout.View.left).isActive = true
        confirmationCodeInputField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: AppLayout.View.right).isActive = true
        
        contentView.addSubview(submitButton)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.topAnchor.constraint(equalTo: confirmationCodeInputField.bottomAnchor, constant: 10).isActive = true
        submitButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: AppLayout.View.left).isActive = true
        submitButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: AppLayout.View.right).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: AppLayout.Button.height).isActive = true
        
        contentView.addSubview(resendCodeButton)
        resendCodeButton.translatesAutoresizingMaskIntoConstraints = false
        resendCodeButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: AppLayout.View.left).isActive = true
        resendCodeButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: AppLayout.View.right).isActive = true
        resendCodeButton.heightAnchor.constraint(equalToConstant: AppLayout.Button.height).isActive = true
        resendCodeButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        
        contentView.addSubview(resendCodeLabel)
        resendCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        resendCodeLabel.bottomAnchor.constraint(equalTo: resendCodeButton.topAnchor, constant: 0).isActive = true
        resendCodeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: AppLayout.View.left).isActive = true
        resendCodeLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: AppLayout.View.right).isActive = true
    }
    
    @objc private func cancel() {
        navigationController?.popViewController(animated: true)
    }
    
    private func resendCode() {
        //
    }
    
    @objc private func completeCodeInput() {
        if let textFiled = view.firstResponder as? UITextField {
            _ = textFieldShouldReturn(textFiled)
        }
    }
    
    private func submit() {
        navigationController?.popToRootViewController(animated: true)
    }
}

//MARK: UITextFieldDelegate
extension SignUpCompleteViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
