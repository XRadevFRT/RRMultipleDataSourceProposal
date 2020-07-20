//
//  CustomTableView.swift
//  UniperReusableComponents
//
//  Created by Radoslav Radev on 14.07.20.
//  Copyright © 2020 Radoslav Radev. All rights reserved.
//

import UIKit

final class CustomTableView: UITableView {
    override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
    
    convenience init(tableViewId: Int) {
        self.init(frame: .zero)
        
        self.tag = tableViewId
    }
}
