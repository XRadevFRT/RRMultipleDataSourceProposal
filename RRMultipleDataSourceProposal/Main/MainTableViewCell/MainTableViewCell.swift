//
//  MainTableViewCell.swift
//  UniperReusableComponents
//
//  Created by Radoslav Radev on 14.07.20.
//  Copyright © 2020 Radoslav Radev. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell, Configurable {
    
    @IBOutlet private weak var emojiLabel: UILabel!
    
    func configureWith(_ data: String) {
        emojiLabel.text = data
    }
}
