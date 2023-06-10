//
//  WelcomeViewController.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 04.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import UIKit
import AWSCognitoIdentityProvider

class WelcomeViewController: UIViewController {
    
    var backgroundView: BackgroundView = {
        let view = BackgroundView()
        view.imageView.image = AppImage.BackGround.lightBlue
        //view.effectView.effect = UIBlurEffect(style: .regular)
        view.backgroundColor = .clear
        return view
    }()
    
    var loginViewController: LoginWithEmailViewController = {
        return LoginWithEmailViewController()
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
    
    lazy var logoImageView: UIImageView = {
       let view = UIImageView()
        view.image = AppImage.Logo.app
        view.contentMode = .scaleAspectFit
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: AppDelegate.self, action: #selector(AppDelegate.showAbout)))
        return view
    }()
    
    var titleLabel: UILabel = {
        let view = UILabel()
        view.text = AppString.View.Welcome.title
        view.textAlignment = .center
        view.textColor = AppColor.View.title
        view.font = AppFont.View.title
        view.numberOfLines = 1
        return view
    }()
    
    var descriptionLabel: UILabel = {
        let view = UILabel()
        view.text = AppString.View.Welcome.description
        view.textColor = AppColor.View.description
        view.textAlignment = .center
        view.font = AppFont.View.description
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        return view
    }()
    
    lazy var loginButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = AppColor.Button.Filled.background
        configuration.baseForegroundColor = AppColor.Button.Filled.foreground
        configuration.background.cornerRadius = AppLayout.Button.cornerRadius
        let view = UIButton(configuration: configuration)
        view.setAttributedTitle(NSAttributedString(string: AppString.Button.loginWithEmail.localized().uppercased(), attributes: [.font: AppFont.Button.title]), for: .normal)
        view.addAction(UIAction(handler: { _ in self.sessionRequest() } ), for: .touchUpInside)
        return view
    }()
    
    var signUpLabel: UILabel = {
        let view = UILabel()
        view.text = AppString.View.Welcome.signUpPrompt
        view.textColor = AppColor.View.description
        view.textAlignment = .center
        view.font = AppFont.View.description
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        return view
    }()
    
    lazy var signUpButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.baseBackgroundColor = AppColor.Button.Plaine.background
        configuration.baseForegroundColor = AppColor.Button.Plaine.foreground
        let view = UIButton(configuration: configuration)
        view.setAttributedTitle(NSAttributedString(string: AppString.Button.registerHere.localized(), attributes: [.font: AppFont.Button.title]), for: .normal)
        view.addAction(UIAction(handler: { _ in self.signUp() } ), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .clear
        
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
        logoImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -200).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: AppLayout.Logo.height).isActive = true
        
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: AppLayout.View.inset).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -AppLayout.View.inset).isActive = true
        titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 40).isActive = true
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: AppLayout.View.inset).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -AppLayout.View.inset).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        
        contentView.addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: AppLayout.View.inset).isActive = true
        signUpButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -AppLayout.View.inset).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: AppLayout.Button.height).isActive = true
        signUpButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        
        contentView.addSubview(signUpLabel)
        signUpLabel.translatesAutoresizingMaskIntoConstraints = false
        signUpLabel.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant: 0).isActive = true
        signUpLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: AppLayout.View.inset).isActive = true
        signUpLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -AppLayout.View.inset).isActive = true
        
        contentView.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.bottomAnchor.constraint(equalTo: signUpLabel.topAnchor, constant: -40).isActive = true
        loginButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: AppLayout.View.inset).isActive = true
        loginButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -AppLayout.View.inset).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: AppLayout.Button.height).isActive = true
        
        AppManager.shared.userPool.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        
        if AppManager.shared.userPool.currentUser()?.isSignedIn ?? false {
            sessionRequest()
        }
    }
    
    private func sessionRequest() {
        AppManager.shared.userPool.currentUser()?.getSession().continueOnSuccessWith(block: { _ in
            DispatchQueue.main.async {
                self.presentOffers()
            }
        })
    }
    
    private func presentOffers() {
        let viewController = VacancyOffersViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func signUp() {
        let viewController = SignUpRegisterViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

//MARK: AWSCognitoIdentityInteractiveAuthenticationDelegate
extension WelcomeViewController: AWSCognitoIdentityInteractiveAuthenticationDelegate {
    func startPasswordAuthentication() -> AWSCognitoIdentityPasswordAuthentication {
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(self.loginViewController, animated: true)
        }
        return loginViewController
    }
}
