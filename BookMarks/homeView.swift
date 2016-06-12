//
//  homeView.swift
//  BookMarks
//
//  Created by Hristov, Martin R. on 6/5/16.
//  Copyright © 2016 Hristov, Martin R. All rights reserved.
//

import UIKit

class homeView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let lable = UILabel()
        lable.text = "Hello Pesho"
        lable.frame = CGRect(x: 20, y: 20, width: 300, height: 50)
        self.addSubview(lable)
        self.backgroundColor = UIColor.whiteColor()
    }
}
 