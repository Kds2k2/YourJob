//
//  UIImage+Attachment.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 05.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    func makeAttachment(maxPixelSize: Int) -> NSTextAttachment? {
        guard self.size.height > 0 else { return nil }
        let aspectRatio = self.size.width / self.size.height
        let imageSize = CGSize(width: Double(maxPixelSize) * aspectRatio, height: Double(maxPixelSize))

        let attachment = NSTextAttachment()
        attachment.bounds = CGRect(origin: CGPoint.zero, size: imageSize)
        attachment.image = self
        return attachment
    }
}
