//
//  VacancyOffersViewController.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 06.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import UIKit
import AWSCognitoIdentityProvider

class VacancyOffersViewController: UIViewController {

    private var vacancies: [String: YourJobVacancy] = [:]
    private var items: [VacancyOfferViewModel] = []
    private var nextToken: String? = nil
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.title = AppString.View.VacancyOffers.navigationItem.localized().uppercased()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var backgroundView: BackgroundView = {
        let view = BackgroundView()
        view.imageView.image = nil
        view.effectView.effect = .none
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let compositionalLayout: UICollectionViewCompositionalLayout = {
            let fraction: CGFloat = AppInfo.isIpad ? 0.5 : 1
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fraction), heightDimension: .estimated(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
            section.interGroupSpacing = 10
            return UICollectionViewCompositionalLayout(section: section)
        }()
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: compositionalLayout)
        view.backgroundColor = .clear
        view.isScrollEnabled = true
        view.showsVerticalScrollIndicator = true
        view.showsHorizontalScrollIndicator = false
        view.indicatorStyle = .default
        view.bounces = true
        view.bouncesZoom = false
        view.alwaysBounceVertical = true
        view.alwaysBounceHorizontal = false
        view.isUserInteractionEnabled = true
        view.clipsToBounds = false
        view.register(VacancyOfferViewCell.self, forCellWithReuseIdentifier: VacancyOfferViewCell.defaultReuseIdentifier)
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: AppImage.Chevron.left, style: .plain, target: self, action: #selector(cancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: AppImage.Filter.normal, style: .plain, target: self, action: #selector(presentFilter))
        
        view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        
        reloadData(with: AppManager.shared.filter, nextToken: nil)
    }
    
    @objc private func presentFilter() {
        let viewController = VacancyFilterViewController(with: AppManager.shared.filter, delegate: self)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc private func cancel() {
        let noAction = UIAlertAction(title: AppString.Button.no.localized(), style: .default)
        let yesAction = UIAlertAction(title: AppString.Button.yes.localized(), style: .destructive, handler: { _ in self.signOut() })
        presentQuestion(title: AppString.View.VacancyOffers.signOut, message: "\n" + AppString.Messages.confirmSignOut, actions: [yesAction, noAction])
    }
    
    private func signOut() {
        AppManager.shared.userPool.currentUser()?.signOut()
        AppManager.shared.clearCache()
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func reloadData(with filter: ListYourJobVacancyFilterInput?, nextToken: String?) {
        let query = ListYourJobVacanciesQuery(filter: filter, limit: 20, nextToken: nextToken)
        AppManager.shared.appSync.fetch(query: query, cachePolicy: .returnCacheDataAndFetch, queue: .global()) { result, error in
            DispatchQueue.main.async {
                if let error = error {
                    AppLog.error(error)
                    return
                }
                
                if let result = result {
                    if let apiError = (result.errors?.isEmpty ?? true) ? nil : ApiError(result.errors!) {
                        AppLog.error(apiError)
                    }
                    
                    if let snapshot = result.data?.listYourJobVacancies?.snapshot {
                        let vacancyConnection = YourJobVacancyConnection(snapshot: snapshot)
                        self.nextToken = vacancyConnection.nextToken
                        vacancyConnection.items?.forEach({ self.vacancies[$0.id] = $0 })
                    }
                    self.reloadItems()
                }
            }
        }
    }
    
    private func reloadItems() {
        items = vacancies.values
            .compactMap({ VacancyOfferViewModel(with: $0) })
            .sorted(by: { $0.timestamp > $1.timestamp })
        
        collectionView.reloadData()
    }
    
    private func presentVacancy(with vacancyId: String) {
        guard let vacancy = self.vacancies[vacancyId] else { return }
        let viewController = VacancyDetailsViewController(with: vacancy)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

//MARK: UICollectionViewDataSource
extension VacancyOffersViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VacancyOfferViewCell.defaultReuseIdentifier, for: indexPath) as! VacancyOfferViewCell
        cell.model = items[indexPath.item]
        return cell
    }
}

//MARK: UICollectionViewDelegate
extension VacancyOffersViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        presentVacancy(with: items[indexPath.item].vacancyId)
    }
}

//MARK: VacancyFilterViewControllerDelegate
extension VacancyOffersViewController: VacancyFilterViewControllerDelegate {
    func vacancyFilter(viewController: VacancyFilterViewController, didAccept filter: ListYourJobVacancyFilterInput?) {
        AppManager.shared.filter = filter
        self.nextToken = nil
        self.vacancies.removeAll()
        self.reloadData(with: AppManager.shared.filter, nextToken: self.nextToken)
    }
}
