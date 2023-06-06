//
//  IntrinsicTableView.swift
//  YourJob
//
//  Created by Dmitro Kryzhanovsky on 06.06.2023.
//  Copyright © 2023 Home. All rights reserved.
//

import Foundation
import UIKit

class IntrinsicTableView : UITableView {
    override var intrinsicContentSize: CGSize {
         self.layoutIfNeeded()
         return self.contentSize
     }
     
     override var contentSize: CGSize {
         didSet {
             self.invalidateIntrinsicContentSize()
         }
     }
     
     override func reloadData() {
         super.reloadData()
         self.invalidateIntrinsicContentSize()
     }
}
