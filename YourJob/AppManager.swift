//
//  AppManager.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 07.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import Foundation

class AppManager {
    
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
    
    public static func cacheUrl(fileName: String) -> URL {
        return filedUrl(directory: "Cache", fileName: fileName)
    }
    
    private static func filedUrl(directory: String?, fileName: String) -> URL{
        let dicrectoryUrl = directoryUrl(directory: directory)
        let fileUrl = dicrectoryUrl.appendingPathComponent(fileName)
        return fileUrl
    }
}
