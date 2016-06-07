//
//  HairlineView.swift
//  BookMarks
//
//  Created by Hristov, Martin R. on 6/7/16.
//  Copyright © 2016 Hristov, Martin R. All rights reserved.
//

import UIKit

class HairlineView: UIView {
    override func awakeFromNib() {
        guard let backgroundColor = self.backgroundColor?.CGColor else { return }
        self.layer.borderColor = backgroundColor
        self.layer.borderWidth = (1.0 / UIScreen.mainScreen().scale) / 2;
        self.backgroundColor = UIColor.clearColor()
    }
}