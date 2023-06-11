//
//  WebImageVIew.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 07.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//
import Foundation
import CryptoKit
import UIKit

class WebImageVIew: UIImageView {
    convenience init(with configuration: WebImageVIew.Configuration) {
        self.init(frame: .zero)
        self.configuration = configuration
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private static let imageCache = NSCache<NSURL, UIImage>()
    
    struct Configuration {
        var placeholderImage: UIImage?
        var animationDuration: TimeInterval = 0
        var animationOptions: UIView.AnimationOptions = .transitionCrossDissolve
    }
    
    private var configuration: Configuration!
    private var currentTast: URLSessionTask? {
        didSet{
            oldValue?.cancel()
            currentTast?.resume()
        }
    }
    private var originalRequestUrl: URL?
    
    public func load(from url: URL) {
        originalRequestUrl = url
        if let imageFromCache = WebImageVIew.imageCache.object(forKey: url as NSURL) {
            present(image: imageFromCache)
            return
        }
        
        let md5Hash = Insecure.MD5.hash(data: url.absoluteString.data(using: .utf8)!)
        let md5String =  md5Hash.map({ String(format: "%02hhx", $0) }).joined()
        let imageFileUrl = AppManager.imageCacheUrl(fileName: "\(md5String).jpg")
        if let imageData = try? Data(contentsOf: imageFileUrl), let imageFromFile = UIImage(data: imageData) {
            WebImageVIew.imageCache.setObject(imageFromFile, forKey: url as NSURL)
            present(image: imageFromFile)
            return
        }
        
        currentTast = URLSession.shared.dataTask(with: url, completionHandler: { [weak self](data, response, error) in
            guard let imageView = self else { return }
            if let error = error {
                AppLog.error(error)
                return
            }
            
            guard let responseUrl = response?.url else { return }
            guard imageView.originalRequestUrl == responseUrl else { return }
            guard let data = data, let image = UIImage(data: data) else { return }
            guard let thumbNail = image.makeThumbnail(maxPixelSize: 512) else { return }
            guard let thumbNailData = thumbNail.jpegData(compressionQuality: 0.8) else { return }
            try? thumbNailData.write(to: imageFileUrl, options: .atomic)
            WebImageVIew.imageCache.setObject(thumbNail, forKey: url as NSURL)
            imageView.present(image: thumbNail)
        })
    }
    
    private func present(image: UIImage?) {
        DispatchQueue.main.async { [weak self] in
            guard let imageView = self else { return }
            
            UIView.transition(with: imageView,
                              duration: imageView.configuration.animationDuration,
                              options: imageView.configuration.animationOptions,
                              animations: {
                imageView.image = image ?? imageView.configuration.placeholderImage
            })
        }
    }
}
