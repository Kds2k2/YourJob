//
//  LoginWithEmailViewController.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 05.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import UIKit

class LoginWithEmailViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
        self.title = AppString.View.LoginWithEmail.navigationItem.localized().uppercased()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        view.text = AppString.View.LoginWithEmail.title
        view.textAlignment = .center
        view.textColor = AppColor.View.title
        view.font = AppFont.View.title
        view.numberOfLines = 1
        return view
    }()
    
    var descriptionLabel: UILabel = {
        let view = UILabel()
        view.text = AppString.View.LoginWithEmail.description
        view.textColor = AppColor.View.description
        view.textAlignment = .center
        view.font = AppFont.View.description
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        return view
    }()
    
    lazy var usernameInputField: UITextField = {
        let view = UITextField()
        view.backgroundColor = AppColor.Input.background
        view.borderStyle = .roundedRect
        view.clearButtonMode = .always
        view.textContentType = .emailAddress
        view.autocapitalizationType = .none
        view.autocorrectionType = .no
        view.returnKeyType = .next
        view.enablesReturnKeyAutomatically = true
        view.font = AppFont.Input.text
        view.attributedPlaceholder = NSAttributedString(string: AppString.Input.Placeholder.email, attributes: [.font: AppFont.Input.placeholder, .foregroundColor: AppColor.Input.placeholder])
        view.textColor = AppColor.Input.text
        view.layer.cornerRadius = AppLayout.Input.cornerRadius
        view.layer.borderColor = AppColor.Input.border.cgColor
        view.layer.borderWidth = AppLayout.Input.borderWidth
        view.delegate = self
        return view
    }()
    
    lazy var passwordInputField: UITextField = {
        let view = SecureTextField()
        view.backgroundColor = AppColor.Input.background
        view.borderStyle = .roundedRect
        view.clearButtonMode = .always
        view.textContentType = .oneTimeCode
        view.autocapitalizationType = .none
        view.autocorrectionType = .no
        view.returnKeyType = .default
        view.enablesReturnKeyAutomatically = true
        view.isSecureTextEntry = true
        view.isSecureTextToggleEnabled = true
        view.font = AppFont.Input.text
        view.attributedPlaceholder = NSAttributedString(string: AppString.Input.Placeholder.password, attributes: [.font: AppFont.Input.placeholder, .foregroundColor: AppColor.Input.placeholder])
        view.textColor = AppColor.Input.text
        view.layer.cornerRadius = AppLayout.Input.cornerRadius
        view.layer.borderColor = AppColor.Input.border.cgColor
        view.layer.borderWidth = AppLayout.Input.borderWidth
        view.delegate = self
        return view
    }()
    
    lazy var loginWithEmailButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = AppColor.Button.Filled.background
        configuration.baseForegroundColor = AppColor.Button.Filled.foreground
        configuration.background.cornerRadius = AppLayout.Button.cornerRadius
        let view = UIButton(configuration: configuration)
        view.setAttributedTitle(NSAttributedString(string: AppString.Button.login.localized().uppercased(), attributes: [.font: AppFont.Button.title]), for: .normal)
        view.addAction(UIAction(handler: { _ in self.login() } ), for: .touchUpInside)
        return view
    }()
    
    lazy var forgotPasswordButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.baseBackgroundColor = AppColor.Button.Plaine.background
        configuration.baseForegroundColor = AppColor.Button.Plaine.foreground
        let view = UIButton(configuration: configuration)
        view.setAttributedTitle(NSAttributedString(string: AppString.Button.forgotPassword.localized(), attributes: [.font: AppFont.Button.title]), for: .normal)
        view.addAction(UIAction(handler: { _ in self.resetPassword() } ), for: .touchUpInside)
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
        logoImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: AppLayout.View.inset).isActive = true
        logoImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -AppLayout.View.inset).isActive = true
        logoImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -220).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: AppLayout.Logo.height).isActive = true
        
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: AppLayout.View.inset).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -AppLayout.View.inset).isActive = true
        titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 40).isActive = true
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: AppLayout.View.inset).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -AppLayout.View.inset).isActive = true

        contentView.addSubview(usernameInputField)
        usernameInputField.translatesAutoresizingMaskIntoConstraints = false
        usernameInputField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 60).isActive = true
        usernameInputField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: AppLayout.View.inset).isActive = true
        usernameInputField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -AppLayout.View.inset).isActive = true

        contentView.addSubview(passwordInputField)
        passwordInputField.translatesAutoresizingMaskIntoConstraints = false
        passwordInputField.topAnchor.constraint(equalTo: usernameInputField.bottomAnchor, constant: 10).isActive = true
        passwordInputField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: AppLayout.View.inset).isActive = true
        passwordInputField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -AppLayout.View.inset).isActive = true
        
        contentView.addSubview(loginWithEmailButton)
        loginWithEmailButton.translatesAutoresizingMaskIntoConstraints = false
        loginWithEmailButton.topAnchor.constraint(equalTo: passwordInputField.bottomAnchor, constant: 10).isActive = true
        loginWithEmailButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: AppLayout.View.inset).isActive = true
        loginWithEmailButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -AppLayout.View.inset).isActive = true
        loginWithEmailButton.heightAnchor.constraint(equalToConstant: AppLayout.Button.height).isActive = true
        
        contentView.addSubview(forgotPasswordButton)
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.topAnchor.constraint(equalTo: loginWithEmailButton.bottomAnchor, constant: 10).isActive = true
        forgotPasswordButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: AppLayout.View.inset).isActive = true
        forgotPasswordButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -AppLayout.View.inset).isActive = true
        forgotPasswordButton.heightAnchor.constraint(equalToConstant: AppLayout.Button.height).isActive = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        appendKeyboardObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeKeyboardObservers()
    }
    
    @objc private func cancel() {
        navigationController?.popViewController(animated: true)
    }
    
    private func login() {
        view.firstResponder?.resignFirstResponder()
        let username = (usernameInputField.text ?? String()).trimmingCharacters(in: .whitespacesAndNewlines)
        let password = (passwordInputField.text ?? String()).trimmingCharacters(in: .whitespacesAndNewlines)
        print(password)
        
        guard !username.isEmpty else {
            presentWarning(title: AppString.Button.login.localized() ,message: "\n" + AppString.Messages.emailRequired.localized())
            return
        }
        
        guard !password.isEmpty else {
            presentWarning(title: AppString.Button.login.localized() ,message: "\n" + AppString.Messages.passwordRequired.localized())
            return
        }
        
        let viewController = VacancyOffersViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func resetPassword() {
        let viewController = ResetPasswordViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

//MARK: UITextFieldDelegate
extension LoginWithEmailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameInputField {
            passwordInputField.becomeFirstResponder()
        }
        else {
            textField.resignFirstResponder()
        }
        return true
    }
}

//MARK: KeyBoard
extension LoginWithEmailViewController {
    private func appendKeyboardObservers () {
         NotificationCenter.default.addObserver(self,
             selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
         NotificationCenter.default.addObserver(self,
             selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
     }

     private func removeKeyboardObservers () {
         NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
         NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
     }
    
    func animateWithKeyboard(notification: NSNotification, animations: ((_ keyboardFrame: CGRect) -> Void)?) {
         let frameKey = UIResponder.keyboardFrameEndUserInfoKey
         let keyboardFrameValue = notification.userInfo![frameKey] as! NSValue
         
         let durationKey = UIResponder.keyboardAnimationDurationUserInfoKey
         let duration = notification.userInfo![durationKey] as! Double
         
         let curveKey = UIResponder.keyboardAnimationCurveUserInfoKey
         let curveValue = notification.userInfo![curveKey] as! Int
         let curve = UIView.AnimationCurve(rawValue: curveValue)!

         let animator = UIViewPropertyAnimator(duration: duration, curve: curve) {
             animations?(keyboardFrameValue.cgRectValue)
             self.view?.layoutIfNeeded()
         }
         animator.startAnimation()
     }
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        animateWithKeyboard(notification: notification) { keyboardFrame in
            guard let activeView = self.view.firstResponder else { return }
            
            let userInfo = notification.userInfo!
            let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
            
            let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height, right: 0)
            self.scrollView.contentInset = contentInset
            self.scrollView.scrollIndicatorInsets = contentInset
            
            let relativeFrame = activeView.convert(activeView.bounds, to: self.scrollView)
            let spaceAboveKeyboard = self.scrollView.frame.height - keyboardFrame.height
            
            let offset = relativeFrame.origin.y - (spaceAboveKeyboard - activeView.frame.height - 80);
            self.scrollView.contentOffset = CGPoint(x: 0, y: max(0, offset))
        }
    }

    @objc func keyboardWillHide(_ notification: NSNotification) {
        animateWithKeyboard(notification: notification) { keyboardFrame in
            self.scrollView.contentInset = UIEdgeInsets.zero
            self.scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
        }
    }
}
