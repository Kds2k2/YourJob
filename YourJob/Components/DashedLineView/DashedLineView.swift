//
//  DashedLineView.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 07.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import Foundation
import UIKit

public enum DashedLineStyle: Int {
    case horizontal = 1
    case vertical = 2
}

class DashedLineView: UIView {
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var style: DashedLineStyle = .horizontal {
        didSet {
            configure()
        }
    }
    
    var lineColor: UIColor = .label {
        didSet {
            shapeLayer.strokeColor = lineColor.cgColor
            self.setNeedsDisplay()
        }
    }
    
    var lineWidth: CGFloat = 1.0 {
        didSet {
            shapeLayer.lineWidth = lineWidth
            self.setNeedsDisplay()
        }
    }
    
    var dashPattern: [NSNumber] = [1,3] {
        didSet {
            shapeLayer.lineDashPattern = dashPattern
            self.setNeedsLayout()
        }
    }
    
    lazy private var shapeLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.strokeColor = lineColor.cgColor
        layer.lineWidth = lineWidth
        layer.lineDashPattern = [1,4]
        return layer
    }()
    
    private func setup() {
        self.layer.addSublayer(shapeLayer)
    }
    
    private func configure() {
        let path = CGMutablePath()
        var points = [CGPoint]()
        if style == .horizontal {
            points.append(CGPoint(x: 0, y: self.frame.height/2.0))
            points.append(CGPoint(x: self.bounds.width, y: self.frame.height/2.0))
        } else {
            points.append(CGPoint(x: self.center.x, y: 0))
            points.append(CGPoint(x: self.center.x, y: self.frame.height))
        }
        
        path.addLines(between: points)
        shapeLayer.frame = self.bounds
        shapeLayer.path = path
        self.setNeedsDisplay()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        shapeLayer.strokeColor = lineColor.cgColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configure()
    }
}
