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
        //TODO: ...
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
