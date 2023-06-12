//
//  AppManager.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 07.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import Foundation
import AWSCognitoIdentityProvider
import AWSAppSync

class AppManager {
    static let shared = AppManager()
    
    let userPool: AWSCognitoIdentityUserPool = {
        return AWSCognitoIdentityUserPool.default()
    }()
    
    let appSync: AWSAppSyncClient = {
        let appSyncClientConfiguration = try! AWSAppSyncClientConfiguration(appSyncServiceConfig: AWSAppSyncServiceConfig(),
                                                                            userPoolsAuthProvider: AppManager.userPoolsAuthProvider,
                                                                            cacheConfiguration: AppManager.cacheConfiguration)
        
        let appSync = try! AWSAppSyncClient(appSyncConfig: appSyncClientConfiguration)
        appSync.apolloClient?.cacheKeyForObject = { $0["id"] }
        return appSync
    }()
    
    func clearCache() {
        do {
            try appSync.clearCaches()
            AppManager.shared.filter = nil
            let imageCacheUrl = AppManager.directoryUrl(directory: "ImageCache")
            let imageUrls = try FileManager.default.contentsOfDirectory(at: imageCacheUrl, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            try imageUrls.forEach({ try FileManager.default.removeItem(at: $0)})
        }
        catch {
            AppLog.error(error)
        }
    }
}

//MARK: FileManager
extension AppManager {
    
    private static func directoryUrl(directory: String?) -> URL {
        let documentDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        ensureDirectory(with: documentDirectoryUrl)
        
        var targetDirectoryUrl = documentDirectoryUrl
        if let directory = directory, !directory.isEmpty {
            targetDirectoryUrl = documentDirectoryUrl.appendingPathComponent(directory)
            ensureDirectory(with: targetDirectoryUrl)
        }
        return targetDirectoryUrl
    }
    
    private static func ensureDirectory(with url: URL) {
        do {
            try FileManager.default.createDirectory(atPath: url.path, withIntermediateDirectories: true, attributes: nil)
        } catch {
            AppLog.error(error)
            fatalError(String(describing: error))
        }
    }
    
    public static func imageCacheUrl(fileName: String) -> URL {
        return filedUrl(directory: "ImageCache", fileName: fileName)
    }
    
    private static func filedUrl(directory: String?, fileName: String) -> URL{
        let dicrectoryUrl = directoryUrl(directory: directory)
        let fileUrl = dicrectoryUrl.appendingPathComponent(fileName)
        return fileUrl
    }
}

//MARK: AWSAppSyncCacheConfiguration
extension AppManager {
    fileprivate static let cacheConfiguration: AWSAppSyncCacheConfiguration = {
        let directoryUrl = AppManager.directoryUrl(directory: "AppSyncCache")
        return try! AWSAppSyncCacheConfiguration(withRootDirectory: directoryUrl)
    }()
}

//MARK:
extension AppManager {
    fileprivate static let userPoolsAuthProvider: AWSCognitoUserPoolsAuthProvider = {
        class UserPoolAuthProvider: AWSCognitoUserPoolsAuthProviderAsync {
            func getLatestAuthToken(_ callback: @escaping (String?, Error?) -> Void) {
                if let user = AppManager.shared.userPool.currentUser() {
                    user.getSession().continueWith { response in
                        if let idToken = response.result?.idToken {
                            callback(idToken.tokenString, nil)
                        } else {
                            callback(nil, response.error)
                        }
                        return nil
                    }
                } else {
                    callback(nil, nil)
                }
            }
        }
        return UserPoolAuthProvider()
    }()
}

extension AppManager {
    struct Keys {
        static let categories = "filter.categories"
        static let title = "filter.title"
        static let location = "filter.location"
        static let isRemote = "filter.isRemote"
        static let salary = "filter.salary"
    }
    
    var filter: ListYourJobVacancyFilterInput? {
        set {
            if let categories = newValue?.or?.compactMap({ $0?.category?.eq }), !categories.isEmpty {
                UserDefaults.standard.setValue(categories, forKey: Keys.categories)
            } else {
                UserDefaults.standard.removeObject(forKey: Keys.categories)
            }
            
            if let title = newValue?.title?.contains, !title.isEmpty {
                UserDefaults.standard.setValue(title, forKey: Keys.title)
            } else {
                UserDefaults.standard.removeObject(forKey: Keys.title)
            }
            
            if let location = newValue?.location?.contains, !location.isEmpty {
                UserDefaults.standard.setValue(location, forKey: Keys.location)
            } else {
                UserDefaults.standard.removeObject(forKey: Keys.location)
            }
            
            if let isRemote = newValue?.isRemote?.eq {
                UserDefaults.standard.setValue(isRemote, forKey: Keys.isRemote)
            } else {
                UserDefaults.standard.removeObject(forKey: Keys.isRemote)
            }
            
            if let salary = newValue?.salary?.gt, salary > 0 {
                UserDefaults.standard.setValue(salary, forKey: Keys.salary)
            } else {
                UserDefaults.standard.removeObject(forKey: Keys.salary)
            }
        }
        get {
            var filter: ListYourJobVacancyFilterInput? = nil
            if let categories = UserDefaults.standard.object(forKey: Keys.categories) as? [String] {
                filter = filter ?? ListYourJobVacancyFilterInput()
                filter?.or = categories.compactMap({ ListYourJobCategoryInput(category: TableStringFilterInput(eq: $0))})
            }
            
            if let title = UserDefaults.standard.object(forKey: Keys.title) as? String {
                filter = filter ?? ListYourJobVacancyFilterInput()
                filter?.title = TableStringFilterInput(contains: title)
            }
            
            if let location = UserDefaults.standard.object(forKey: Keys.location) as? String {
                filter = filter ?? ListYourJobVacancyFilterInput()
                filter?.location = TableStringFilterInput(contains: location)
            }
            
            if let isRemote = UserDefaults.standard.object(forKey: Keys.isRemote) as? Bool {
                filter = filter ?? ListYourJobVacancyFilterInput()
                filter?.isRemote = TableBooleanFilterInput(eq: isRemote)
            }
            
            if let salary = UserDefaults.standard.object(forKey: Keys.salary) as? Int {
                filter = filter ?? ListYourJobVacancyFilterInput()
                filter?.salary = TableIntFilterInput(gt: salary)
            }
            
            return filter
        }
    }
}
