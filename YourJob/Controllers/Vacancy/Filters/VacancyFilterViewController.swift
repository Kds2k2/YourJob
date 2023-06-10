//
//  VacancyFilterViewController.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 06.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import UIKit

class VacancyFilterViewController: UIViewController {
    
    private var model: VacancyFilterViewModel!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        model = VacancyFilterViewModel.mock()
        self.title = AppString.View.VacancyFilter.navigationItem.localized().uppercased()
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
    
    var titleLabel: UILabel = {
        let view = UILabel()
        view.text = AppString.View.VacancyFilter.title
        view.textAlignment = .center
        view.textColor = AppColor.View.title
        view.font = AppFont.View.title
        view.numberOfLines = 1
        return view
    }()
    
    var descriptionLabel: UILabel = {
        let view = UILabel()
        view.text = AppString.View.VacancyFilter.description
        view.textColor = AppColor.View.description
        view.textAlignment = .center
        view.font = AppFont.View.description
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        return view
    }()
    
    lazy var tableView: UITableView = {
        var view = IntrinsicTableView()
        view.backgroundColor = .green
        view.isScrollEnabled = false
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.bounces = false
        view.bouncesZoom = false
        view.alwaysBounceVertical = false
        view.alwaysBounceHorizontal = false
        view.isUserInteractionEnabled = true
        view.sectionHeaderTopPadding = 0
        view.estimatedRowHeight = UITableView.automaticDimension
        view.rowHeight = UITableView.automaticDimension
        view.sectionHeaderHeight = UITableView.automaticDimension
        view.allowsSelection = true
        view.allowsMultipleSelection = false
        view.separatorStyle = .none
        view.separatorColor = .clear
        view.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        view.clipsToBounds = true
        view.register(VacancySectionHeaderViewCell.self, forCellReuseIdentifier: VacancySectionHeaderViewCell.defaultReuseIdentifier)
        view.register(VacancyFilterStringViewCell.self, forCellReuseIdentifier: VacancyFilterStringViewCell.defaultReuseIdentifier)
        view.register(VacancyFilterBoolViewCell.self, forCellReuseIdentifier: VacancyFilterBoolViewCell.defaultReuseIdentifier)
        view.register(VacancyFilterNumberViewCell.self, forCellReuseIdentifier: VacancyFilterNumberViewCell.defaultReuseIdentifier)
        view.register(VacancyFilterOptionViewCell.self, forCellReuseIdentifier: VacancyFilterOptionViewCell.defaultReuseIdentifier)
        view.isEditing = false
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    lazy var acceptButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = AppColor.Button.Filled.background
        configuration.baseForegroundColor = AppColor.Button.Filled.foreground
        configuration.background.cornerRadius = AppLayout.Button.cornerRadius
        let view = UIButton(configuration: configuration)
        view.setAttributedTitle(NSAttributedString(string: AppString.Button.accept.localized().uppercased(), attributes: [.font: AppFont.Button.title]), for: .normal)
        view.addAction(UIAction(handler: { _ in self.accept() } ), for: .touchUpInside)
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
        
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: AppLayout.View.inset).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -AppLayout.View.inset).isActive = true
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: AppLayout.View.inset).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -AppLayout.View.inset).isActive = true
        
        contentView.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 30).isActive = true
        tableView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: AppLayout.Table.inset).isActive = true
        tableView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -AppLayout.Table.inset).isActive = true
        
        contentView.addSubview(acceptButton)
        acceptButton.translatesAutoresizingMaskIntoConstraints = false
        acceptButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        acceptButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: AppLayout.View.inset).isActive = true
        acceptButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -AppLayout.View.inset).isActive = true
        acceptButton.heightAnchor.constraint(equalToConstant: AppLayout.Button.height).isActive = true
        acceptButton.topAnchor.constraint(greaterThanOrEqualTo: tableView.bottomAnchor, constant: 40).isActive = true
        
        tableView.reloadData()
    }
    
    private func accept() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func cancel() {
        navigationController?.popViewController(animated: true)
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
}

//MARK: UITableViewDataSource
extension VacancyFilterViewController: UITableViewDataSource {
    enum FilterSection: Int, CaseIterable {
        case category = 0
        case jobTitle = 1
        case location = 2
        case isRemote = 3
        case salary = 4
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return FilterSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == FilterSection.category.rawValue { return model.categories.count+1 }
        else { return 2 }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case FilterSection.category.rawValue:
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: VacancySectionHeaderViewCell.defaultReuseIdentifier) as! VacancySectionHeaderViewCell
                cell.model = VacancySectionHeaderViewModel(with: AppString.View.VacancyFilter.categories.localized().uppercased())
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: VacancyFilterOptionViewCell.defaultReuseIdentifier) as! VacancyFilterOptionViewCell
                cell.model = model.categories[indexPath.row-1]
                return cell
            }
        case FilterSection.jobTitle.rawValue:
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: VacancySectionHeaderViewCell.defaultReuseIdentifier) as! VacancySectionHeaderViewCell
                cell.model = VacancySectionHeaderViewModel(with: AppString.View.VacancyFilter.jobTitle.localized().uppercased())
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: VacancyFilterStringViewCell.defaultReuseIdentifier) as! VacancyFilterStringViewCell
                cell.model = model.jobTitle
                return cell
            }
        case FilterSection.location.rawValue:
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: VacancySectionHeaderViewCell.defaultReuseIdentifier) as! VacancySectionHeaderViewCell
                cell.model = VacancySectionHeaderViewModel(with: AppString.View.VacancyFilter.location.localized().uppercased())
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: VacancyFilterStringViewCell.defaultReuseIdentifier) as! VacancyFilterStringViewCell
                cell.model = model.location
                return cell
            }
        case FilterSection.isRemote.rawValue:
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: VacancySectionHeaderViewCell.defaultReuseIdentifier) as! VacancySectionHeaderViewCell
                cell.model = VacancySectionHeaderViewModel(with: AppString.View.VacancyFilter.isRemote.localized().uppercased())
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: VacancyFilterBoolViewCell.defaultReuseIdentifier) as! VacancyFilterBoolViewCell
                cell.model = model.isRemote
                return cell
            }
        case FilterSection.salary.rawValue:
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: VacancySectionHeaderViewCell.defaultReuseIdentifier) as! VacancySectionHeaderViewCell
                cell.model = VacancySectionHeaderViewModel(with: AppString.View.VacancyFilter.salary.localized().uppercased())
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: VacancyFilterNumberViewCell.defaultReuseIdentifier) as! VacancyFilterNumberViewCell
                cell.model = model.salary
                return cell
            }
        default:
            return UITableViewCell()
        }
    }
}

//MARK: UITableViewDelegate
extension VacancyFilterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: KeyBoard
extension VacancyFilterViewController {
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

